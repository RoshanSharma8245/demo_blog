import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;

import 'conscent_initializer.dart';
import 'conscent_methods.dart';
import 'constants.dart';
import 'coreDb.dart';
import 'datamodel/api_mode.dart';
import 'datamodel/auto_login_response.dart';
import 'datamodel/journey_response.dart';
import 'datamodel/login_challengeget.dart';

class WebViewDefaultApp extends StatefulWidget {
  final String redirectUrl;

  const WebViewDefaultApp({Key? key, required this.redirectUrl})
      : super(key: key);

  @override
  State<WebViewDefaultApp> createState() => _WebViewDefaultAppState();
}

enum ProgressIndicatorType { circular, linear }

class _WebViewDefaultAppState extends State<WebViewDefaultApp> {
  String? loginId;

  // String? sessionId;
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  double progress = 0;
  ProgressIndicatorType type = ProgressIndicatorType.linear;
  bool showContent = false;
  bool isLoaded = false;

  @override
  void initState() {
    if (mounted) {
      // getLoginChallengeId();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    getLoginChallengeId();
  }

  Future<String?> getLoginChallengeId() async {
    loginId = await CoreDb.instance().getLoginId();

    var uri = Uri.parse('${APIMode.BASE_URL}api/v1/login-challenge/$loginId');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      LoginChallengeget loginChallengeget =
          loginChallengegetFromJson(response.body);

      String? sessionId = loginChallengeget.sessionId;
      String? userId = loginChallengeget.userId;
      await CoreDb.instance().setSessionId(sessionId);
      await CoreDb.instance().setUserId(userId);
      const CircularProgressIndicator();
      return sessionId;
    } else {
      ConscentMethods().onPluginError(response.body);
    }
    return '';
  }

  Future<void> checkContentAccess(
      String clientId, String clientContentId, String? sessionId) async {
    JourneyResponse? journeyResponse =
        await ConscentMethods().getJourneyResponse();

    if (journeyResponse?.signature != null) {
      if (context.mounted) {
        Navigator.pop(context, {"response": true});
      }
    } else {
      ConscentMethods()
          .onPluginError("journeyResponse ${journeyResponse?.sessionExists}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? _getMainScreen()
        : WillPopScope(
            onWillPop: () async {
              if (Platform.isAndroid) {
                // detect Android back button click
                final controller = webViewController;
                if (controller != null) {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                    return false;
                  }
                }
                return true;
              }
              return Future.value(false);
            },
            child: _getMainScreen());
  }

  Widget _getMainScreen() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("", style: TextStyle(fontSize: 18)),
          automaticallyImplyLeading: !Platform.isIOS,
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: Stack(children: [
            InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(url: WebUri(widget.redirectUrl)),
              onWebViewCreated: (controller) {
                webViewController = controller;

                controller.addJavaScriptHandler(
                    handlerName: 'AUTOLOGIN',
                    callback: (args) async {
                      AutoLoginResponse autoLoginResponse =
                          autoLoginResponseFromJson(args[0]);
                      loginId = await CoreDb.instance().getLoginId();
                      if (autoLoginResponse.status == true) {
                        Constants.logIn = true;
                        String? sessionId = autoLoginResponse.sessionId;
                        if (sessionId != null) {
                          String s = sessionId;
                          await CoreDb.instance().setSessionId(s);
                        }
                        await CoreDb.instance()
                            .setUserId(autoLoginResponse.userId);

                        if (context.mounted) {
                          Navigator.pop(context, {
                            autoLoginResponse.userId,
                            autoLoginResponse.status
                          });
                        }
                      } else {
                        if (context.mounted) {
                          if (loginId != null) {
                            Navigator.pop(context, {
                              autoLoginResponse.message,
                              autoLoginResponse.status
                            });
                          }
                        }
                      }
                    });

                controller.addJavaScriptHandler(
                    handlerName: 'LOGINCHALLENGE',
                    callback: (args) async {
                      if (args[0] == 'loginSuccess') {
                        if (kDebugMode) {
                          print("loginSuccess");
                        }
                        const CircularProgressIndicator();
                        String? sessionId = await getLoginChallengeId();
                        checkContentAccess('${ConscentInitializer.mClientId}',
                            '${ConscentInitializer.mContentId}', sessionId);
                      }
                    });
              },
              onReceivedHttpError: (controller, request, errorResponse) async {
                // Handle HTTP errors here
                var isForMainFrame = request.isForMainFrame ?? false;
                if (!isForMainFrame) {
                  return;
                }

                final snackBar = SnackBar(
                  content: Text(
                      'HTTP error for URL: ${request.url} with Status: ${errorResponse.statusCode} ${errorResponse.reasonPhrase ?? ''}'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              onReceivedError: (controller, request, error) async {
                // Handle web page loading errors here
                var isForMainFrame = request.isForMainFrame ?? false;
                if (!isForMainFrame ||
                    (!kIsWeb &&
                        defaultTargetPlatform == TargetPlatform.iOS &&
                        error.type == WebResourceErrorType.CANCELLED)) {
                  return;
                }

                var errorUrl = request.url;
                controller.loadData(data: """
                      <!DOCTYPE html>
                          <html>
                            <head>
                              <meta charset="utf-8" />
                              <title>No connection to the internet</title>
                              <style>
                                html,body { margin:0; padding:0; }
                                html {
                                  background: #191919 -webkit-linear-gradient(top, #000 0%, #191919 100%) no-repeat;
                                  background: #191919 linear-gradient(to bottom, #000 0%, #191919 100%) no-repeat;
                                }
                                body {
                                  font-family: sans-serif;
                                  color: #FFF;
                                  text-align: center;
                                  font-size: 150%;
                                }
                                h1, h2 { font-weight: normal; }
                                h1 { margin: 0 auto; padding: 0.15em; font-size: 10em; text-shadow: 0 2px 2px #000; }
                                h2 { margin-bottom: 2em; }
                              </style>
                            </head>
                            <body>
                              <h1>⚠</h1>
                              <h2>Broken Internet Connection</h2>
                              <p>Please make sure that your WiFi or broadband is on.</p>
                              <p class="desc">If everything is in order, refresh your page.</p>
                            </body>
                          </html>
                          """, baseUrl: errorUrl, historyUrl: errorUrl);
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
            progress < 1.0 ? getProgressIndicator() : Container(),
          ])),
        ]));
  }

  Widget getProgressIndicator() {
    return LinearProgressIndicator(
      color: Colors.redAccent,
      value: progress,
    );
  }
}

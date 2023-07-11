import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;

import 'conscent_initializer.dart';
import 'conscent_methods.dart';
import 'coreDb.dart';
import 'datamodel/api_mode.dart';
import 'datamodel/login_challengeget.dart';

class WebViewApps extends StatefulWidget {
  String tiersId;
  bool isWoman;

  WebViewApps({this.tiersId = '', required this.isWoman, super.key});

  @override
  State<WebViewApps> createState() => _WebViewAppStates();
}

enum ProgressIndicatorType { circular, linear }

class _WebViewAppStates extends State<WebViewApps> {
  String? loginId;
  String ar = "availFreeTrial=true%20";
  late String fn;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final webViewKey = GlobalKey<_WebViewAppStates>();

  InAppWebViewController? webViewController;
  double progress = 0;
  ProgressIndicatorType type = ProgressIndicatorType.linear;

  @override
  void initState() {
    _refreshIndicatorKey.currentState?.show();
    icon:
    const Icon(Icons.refresh);
    if (mounted) {
      getLoginChallengeId();
    }

    if (widget.isWoman) {
      fn = ar;
    } else {
      fn = "";
    }

    super.initState();
  }

  getLoginChallengeId() async {
    loginId = CoreDb.instance().getLoginId();

    getSessionID(loginId.toString());
    setState(() {
      webViewController?.loadUrl(
          urlRequest: URLRequest(
              url: WebUri(
                  "${APIMode.SERVICE_BASE_URL}/subscription?tierId=${widget.tiersId}&clientId=${ConscentInitializer.mClientId}&$fn&siteUrl=${APIMode.SERVICE_BASE_URL}&clientContentId=${ConscentInitializer.mContentId}&loginChallenge=$loginId")));
    });
  }

  Future<String> getSessionID(String loginId) async {
    var uri = Uri.parse('${APIMode.BASE_URL}api/v1/login-challenge/$loginId');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      LoginChallengeget loginChallengeget =
          loginChallengegetFromJson(response.body);

      String sessionId = loginChallengeget.toString();
      CoreDb.instance().setSessionId(sessionId);

      const CircularProgressIndicator();
      return sessionId;
    } else {
      ConscentMethods().onPluginError(response.body);
    }
    return '';
  }

  // dynamic dataMains;
  Future<void> getPstss(String sessionId) async {
    sessionId = await CoreDb.instance().getSessionId() ?? "sessionId";

    final uri = Uri.parse(
        '${APIMode.BASE_URL}api/v1/subscription/access?sessionId=$sessionId&clientId=${ConscentInitializer.mClientId}');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var responseString = response.body;

      if (mounted) {
        Navigator.pop(context, {
          "response": responseString
          // "sessionId":dataMain['sessionId']
        });
      }
    } else {
      ConscentMethods().onPluginError(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Conscent}", style: TextStyle(fontSize: 18)),
          actions: [
            IconButton(
                onPressed: () async {
                  await webViewController?.reload();
                },
                icon: const Icon(Icons.refresh)),
          ],
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: Stack(children: [
            InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                  url: WebUri(
                      "${APIMode.SERVICE_BASE_URL}/subscription?tierId=${widget.tiersId}&clientId=${ConscentInitializer.mClientId}&$fn&siteUrl=${APIMode.SERVICE_BASE_URL}&clientContentId=${ConscentInitializer.mContentId}&loginChallenge=$loginId")),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
            progress < 1.0 ? getProgressIndicator(type) : Container(),
          ])),
        ]));
  }

  Widget getProgressIndicator(ProgressIndicatorType type) {
    return LinearProgressIndicator(
      color: Colors.redAccent,
      value: progress,
    );
  }
}

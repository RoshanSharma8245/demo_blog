import 'dart:convert';

import 'package:demo_blog/conscent_sdk/web_view_default.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'conscent_initializer.dart';
import 'conscent_methods.dart';
import 'constants.dart';
import 'coreDb.dart';
import 'datamodel/api_mode.dart';
import 'datamodel/content_details2.dart';
import 'datamodel/login_challenge_post.dart';
import 'datamodel/subscription_access_model.dart';

ConscentMethods? conscentMethods;

class DefaultSub extends StatefulWidget {
  Function(String) sessionCallback;

  DefaultSub(this.sessionCallback, {Key? key}) : super(key: key);

  @override
  State<DefaultSub> createState() => _MyAppppState();
}

class _MyAppppState extends State<DefaultSub> {
  bool visible = false;

  final loginChallengeId = TextEditingController();
  final redirectTo = TextEditingController();

  final clientId = TextEditingController();
  final clientContentId = TextEditingController();
  final sessionId = TextEditingController();

  @override
  void initState() {
    super.initState();
    Constants.totalTime = 0;
    conscentMethods = ConscentMethods();

    getPsts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Object? get filteredProducts => null;

  Future<String> createLogInChallenge() async {
    String? loginId = await CoreDb.instance().getLoginId();
    http.Response response;
    if (loginId == null) {
      response = await http
          .post(Uri.parse('${APIMode.BASE_URL}api/v1/login-challenge'), body: {
        "loginChallengeId":
            '${DateTime.now().millisecondsSinceEpoch.toString()}${const Uuid().v4()}',
        "redirectTo": ""
      });
    } else {
      return loginId;
    }

    if (response.statusCode == 201) {
      var responseString = response.body;
      String loginChallengeId =
          loginChallengepostFromJson(responseString).loginChallengeId;
      await CoreDb.instance().setLoginId(loginChallengeId);
      return loginChallengeId;
    } else {
      conscentMethods?.onPluginError(response.body);
      throw Exception('Failed to create album.');
    }
  }

// Webview
  Future<SubscriptionAccess> getPostss() async {
    var client = http.Client();
    var uri = Uri.parse('${APIMode.BASE_URL}api/v1/subscription/access?');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return subscriptionAccessFromJson(json);
    } else {
      conscentMethods?.onPluginError(response.body);
      throw Exception('Failed to create album.');
    }
  }

  //microPricing Api ----------------------------------------------------------------------------------------------------
  dynamic dataMain;

  getPsts() async {
    var url = Uri.parse(
        '${APIMode.BASE_URL}api/v1/content?clientContentId=${ConscentInitializer.mContentId}&clientId=${ConscentInitializer.mClientId}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      dataMain = jsonDecode(response.body);
      ContentDetails2 contentDetails2 =
          ContentDetails2.fromJson(json.decode(response.body));
      Constants.numOfCta = 1;
      if (contentDetails2.validPass != null) {
        Constants.numOfCta = Constants.numOfCta + 1;
      }
      bool subscriptionsExist = false;
      subscriptionsExist = contentDetails2.subscriptionsExist!;
      if (subscriptionsExist) {
        Constants.numOfCta = Constants.numOfCta + 1;
      }

      var subscriptionUrl = dataMain["subscriptionUrl"];
      await CoreDb.instance().setSubsUrl(subscriptionUrl);
      setState(() {});
    } else {
      conscentMethods?.onPluginError(response.body);
      throw Exception('Failed to load album');
    }
  }

//API logout post
  @override
  Widget build(BuildContext context) {
    conscentMethods?.paywallViewEvent();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.97,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Card(
        color: Colors.white,
        elevation: 20,
        surfaceTintColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Color.fromRGBO(240, 240, 240, 1.0),
                ),
                child: const ListTile(
                  // tileColor: Color.fromRGBO(240, 240, 240, 1.0),
                  title: Text(
                    'Continue Reading ...',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              ListTile(
                title: Text(
                  dataMain == null
                      ? ""
                      : dataMain["paywallCustomization"]
                              ["micropaymentDisplaytext"]
                          .toString(),
                  //  _dataMain.paywallCustomization.micropaymentDisplaytext,
                  textAlign: TextAlign.center,
                ),
              ),

              ListTile(
                title: Text(
                  dataMain == null
                      ? ""
                      : "${"Pay " + dataMain["currencySymbol"]}${dataMain["price"]} to read now",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              ElevatedButton(
                //////////////
                onPressed: () async {
                  conscentMethods?.paywallClickEvent("BUY_NOW");
                  String redirectUrl =
                      await ConscentMethods().prepareLoginChallenge([""]);
                  createLogInChallenge().then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WebViewDefaultApp(redirectUrl: redirectUrl)),
                    ).then((value) {
                      if (value != null) {
                        dynamic response = value['response'];
                        widget.sessionCallback(response);
                      }
                    });
                  });
                },

                ////////

                // child:
                //   Colors.black,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: const Color.fromRGBO(245, 194, 203, 1.0),
                  minimumSize: const Size(240, 50),
                ),

                child: const Text('Read Now',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),

              if (!Constants.logIn)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Already Purchased?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    TextButton(
                      child: const Text(
                        'Log into Conscent',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(245, 194, 203, 1.0)),
                      ),
                      onPressed: () async {
                        conscentMethods?.paywallClickEvent("BUY_NOW");
                        String redirectUrl =
                            await ConscentMethods().prepareLoginChallenge([""]);
                        createLogInChallenge().then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewDefaultApp(
                                    redirectUrl: redirectUrl)),
                          ).then((value) {
                            if (value != null) {
                              dynamic response = value['response'];
                              widget.sessionCallback(response);
                            }
                          });
                        });
                      },
                    ),
                  ],
                ),

              const ListTile(
                title: Text(
                  'Onces paid this story is free for 30 Days',
                  textAlign: TextAlign.center,
                ),
              ),

              //------------HIDE DATA FROM PASSES--------------------------------------------------

              Visibility(
                  visible: dataMain == null
                      ? false
                      : dataMain["validPass"] == null
                          ? false
                          : true,
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          '------------------  OR  ------------------',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ListTile(
                        title: Text(
                            dataMain != null && dataMain["validPass"] == null
                                ? ''
                                : ''),
                        subtitle: Text(
                          dataMain == null
                              ? ""
                              : "${dataMain["validPass"] == null ? 'No hrs' : dataMain["validPass"]['duration'] ?? 'No data'} - hrs unlimited access to premium content",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          conscentMethods?.paywallClickEvent("PASS");
                          String redirectUrl = await ConscentMethods()
                              .prepareLoginChallenge(["pass"]);
                          createLogInChallenge().then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebViewDefaultApp(
                                      redirectUrl: redirectUrl)),
                            ).then((value) {
                              if (value != null) {
                                dynamic response = value['response'];
                                widget.sessionCallback(response);
                              }
                            });
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(240, 50),
                            shape: const StadiumBorder(),
                            primary: Colors.white,
                            // onSurface: Colors.black,
                            side: const BorderSide(
                                width: 2.0, color: Colors.black)),
                        child: Text(
                            'Buy a pass for ₹ ${dataMain != null && dataMain["validPass"] != null ? dataMain["validPass"]["price"].toString() : ""}',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )),

              Visibility(
                  visible: dataMain == null
                      ? false
                      : dataMain["subscriptionsExist"] == false
                          ? false
                          : true,
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          '------------------  OR  ------------------',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ListTile(
                        title: Text(dataMain != null &&
                                dataMain["subscriptionsExist"] == false
                            ? ''
                            : ''),
                        subtitle: Text(
                          dataMain == null
                              ? ""
                              : "${dataMain["subscriptionsExist"] == false ? 'No hrs' : dataMain["paywallCustomization"]['subscriptionTitle'] ?? 'No data'} ",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          dataMain == null
                              ? ""
                              : dataMain["paywallCustomization"]
                                  ["subscriptionText"],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          conscentMethods?.paywallClickEvent("SUBS");
                          String redirectUrl = await ConscentMethods()
                              .prepareLoginChallenge(["subscription"]);
                          createLogInChallenge().then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebViewDefaultApp(
                                      redirectUrl: redirectUrl)),
                            ).then((value) {
                              if (value != null) {
                                dynamic response = value['response'];
                                widget.sessionCallback(response);
                              }
                            });
                          });
                        },

                        // style: ElevatedButton.styleFrom(
                        //   shape: const StadiumBorder(),
                        // ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(240, 50),
                            shape: const StadiumBorder(),
                            primary: Colors.white,
                            // onSurface: Colors.black,
                            side: const BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(245, 194, 203, 1.0))),
                        child: const Text('Subscribe Now',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(245, 194, 203, 1.0))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Already a Subscriber?',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(245, 194, 203, 1.0)),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

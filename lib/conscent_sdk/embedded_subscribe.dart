import 'dart:convert';

import 'package:demo_blog/conscent_sdk/webviews.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'conscent_initializer.dart';
import 'conscent_methods.dart';
import 'coreDb.dart';
import 'datamodel/api_mode.dart';
import 'datamodel/embedded_model.dart';
import 'datamodel/embedded_subscribtion.dart';
import 'datamodel/login_challenge_post.dart';

class Subscribe extends StatefulWidget {
  Function(String) sessionCallback;
  Subscribe(this.sessionCallback, {Key? key}) : super(key: key);

  @override
  State<Subscribe> createState() => SubscribeState();
}

class SubscribeState extends State<Subscribe> {
  //post login challendeId
  dynamic dataMain;
  bool buttonenabled = true;

  Future<LoginChallengepost> createLoginChallenge(
      String loginChallengeId, String redirectTo) async {
    var response = await http
        .post(Uri.parse('${APIMode.BASE_URL}api/v1/login-challenge'), body: {
      "loginChallengeId":
          '${DateTime.now().millisecondsSinceEpoch.toString()}${const Uuid().v4().toString()}',
      "redirectTo": redirectTo
    });

    if (response.statusCode == 201) {
      dataMain = jsonDecode(response.body);
      var responseString = response.body;
      String loginChallengeId =
          loginChallengepostFromJson(responseString).loginChallengeId;

      CoreDb.instance().setLoginId(loginChallengeId);

      return loginChallengepostFromJson(responseString);
    } else {
      ConscentMethods().onPluginError(response.body);
      throw Exception('Failed to create album.');
    }
  }

  clearData() async {}

  var uuid =
      '${DateTime.now().millisecondsSinceEpoch.toString()}${const Uuid().v4()}';
  int i = 0;
  int selected = 0;
  List result = [];
  bool isWoman = true;
  var dummy;
  var tierId = "";
  Embedded? model;
  final loginChallengeId = TextEditingController();
  final redirectTo = TextEditingController();
  bool isLoaded = false;

  doOnLaunch() async {
    var response = await http.get(Uri.parse(
        "${APIMode.BASE_URL}api/v1/subscription/embedded-subscription?clientId=${ConscentInitializer.mClientId}"));
    result = jsonDecode(response.body)["subscriptions"];
    dummy = jsonDecode(response.body);

    model = Embedded.fromJson(dummy);
    tierId = result[i]['tiers'][0]['offers'][0]['_id'];

    if (response.statusCode != 200) {
      ConscentMethods().onPluginError(response.body);
    }

    setState(() {
      isLoaded = true;
    });
  }

  //subsciption access
  dynamic dataMains;

  getPtssss() async {
    var sessionIds = CoreDb.instance().getSessionId();
    var uri = Uri.parse(
        '${APIMode.BASE_URL}api/v1/subscription/access?sessionId=${sessionIds}clientId=${ConscentInitializer.mClientId}');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      dataMains = jsonDecode(response.body);

      setState(() {});
    } else {
      ConscentMethods().onPluginError(response.body);
      throw Exception('Failed to load album');
    }
  }

  var controller1;
  EmbeddedSubscribtion? _embeddedSubscribtion;

  var data;
  bool isPressed = false;

  int pageIndex = 0;

  //Widget MyBullet .......................................................

  Widget bullet() {
    {
      return Container(
        height: 5,
        width: 5,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(162, 32, 38, 1.0),
          shape: BoxShape.circle,
        ),
      );
    }
  }

  //Widget BulletMark .......................................................
  List<String> benefitsList() {
    if (result[i] == null) {
      return result[i]["benefits"].split(',').toList();
    }
    return result[i]["benefits"].split(',').toList();
  }

  Widget bulletMark() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (var line in benefitsList()) styleline(line),
      ],
    );
  }

  Widget styleline(String line) {
    return SizedBox(
        height: 38,
        child: Row(children: [
          bullet(),
          const SizedBox(
            width: 40,
          ),
          Text(
            line,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ]));
  }

  bool active = true;

  Widget homeBody() {
    if (!isLoaded) {
      return const CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: dummy["subscriptions"].length == 1 ||
                            i > 0 == dummy["subscriptions"].length - 1
                        ? false
                        : true,
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: i > 0 && i > 0
                                ? () {
                                    selected = 0;
                                    setState(() {
                                      buttonenabled = true;
                                      i--;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.arrow_back_ios)),
                      ],
                    )),
                Expanded(
                    child: SizedBox(
                        height: result[i]["tiers"].length > 4 ? 400 : 220,
                        // height:320,
                        child: Center(
                          child: GridView.builder(
                              itemCount: result.isNotEmpty
                                  ? result[i]["tiers"].length
                                  : 0,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                      childAspectRatio: 1.6),
                              itemBuilder: (context, index) {
                                var basePrice =
                                    result[i]["tiers"][index]["basePrice"];
                                String percent = '';

                                if (basePrice != 0) {
                                  percent =
                                      "${(100 - ((result[i]["tiers"][index]["price"] / basePrice) * 100)).toStringAsFixed(0)}% off";
                                }
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = index;
                                      // isPressed = !isPressed;
                                    });
                                  },
                                  // child: Align(
                                  //   alignment: Alignment.center,

                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      //  height:result[i]["tiers"].length>4? 330:220,
                                      //    alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        //  color: Colors.red,
                                        border: Border.all(
                                          // color: Colors.black,
                                          color: selected == index
                                              // ? Colors.red
                                              ? const Color.fromRGBO(
                                                  171, 58, 53, 1.0)
                                              : const Color.fromRGBO(
                                                  221, 221, 221, 1.0),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    result[i]["tiers"][index][
                                                                    "basePrice"]
                                                                .toString() ==
                                                            "0"
                                                        ? ""
                                                        : "₹${result[i]["tiers"][index]["basePrice"]} ",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 15,
                                                        color: selected == index
                                                            ? Colors.grey
                                                            : Colors.grey),
                                                  ),

                                                  // result[i]!=null&& result[i]["tiers"][index]["basePrice"] == null,

                                                  if (result[i]['tiers'][index]
                                                          ['basePrice'] !=
                                                      0)
                                                    Text(
                                                      //      result[i]!=null)!&& result[i]["tiers"] == null
                                                      percent.toString(),

                                                      style: const TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Text(
                                                "₹${result[i]["tiers"][index]["price"]}.00",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: selected == index
                                                        ? Colors.black
                                                        : Colors.black),
                                              ),
                                              Text(
                                                "${result[i]["tiers"][index]["duration"]} month",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: selected == index
                                                        ? Colors.black
                                                        : Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // ),
                                );
                              }),
                        ))),
                Visibility(
                    visible: dummy["subscriptions"].length == 1 ||
                            i == dummy["subscriptions"].length - 1
                        ? false
                        : true,
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: i < dummy["subscriptions"].length - 1 &&
                                    i != dummy["subscriptions"].length
                                ? () {
                                    setState(() {
                                      selected = 0;
                                      buttonenabled = false;
                                      i++;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.arrow_forward_ios)),
                      ],
                    )),
              ],
            ),
            //-----------------------------------------------------------------------

            const Text(
              "Benefits: You will Get",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(child: bulletMark()),

            const SizedBox(
              height: 25,
            ),

            result[i] != null && result[i]["freeTrial"]["duration"] == null
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isWoman,
                        checkColor: Colors.white,
                        activeColor: const Color.fromRGBO(162, 32, 38, 1.0),
                        onChanged: (value) {
                          setState(() {
                            isWoman = value!;
                          });
                        },
                      ),
                      // result[i]!=null&& result[i]["tiers"][index]["basePrice"] == null,
                      Text(
                          "Start your ${result[i]["freeTrial"]["duration"].toString()}-days",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      const Text(
                        " Free",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(162, 32, 38, 1.0),
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        " Trail",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )

            //----------------------------------------------------------------------
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var data;
    bool isPressed = false;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    tileColor: const Color.fromRGBO(162, 32, 38, 1.0),
                    title: Text(
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      dummy != null ? ' ${dummy["title"]}' : "",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      'Choose Plan',
                      textAlign: TextAlign.center,
                      //  style: TextStyle(fontSize: 20),
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    // height: 400,
                    //width: double.infinity,
                    //  color: Colors.blue,
                    child: homeBody(),
                  ),

                  //----------------------------------------------------------------------------------------

                  //--------------------------------------------------------------------------------
                  // Container(
                  //   child: SizedBox(child: _Benefits()),
                  // ),

                  ElevatedButton(
                    onPressed: () {
                      createLoginChallenge(
                              loginChallengeId.text, redirectTo.text)
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewApps(
                                  tiersId: model?.subscriptions?[i]
                                          .tiers?[selected].sId ??
                                      "",
                                  isWoman: isWoman)),
                        ).then((value) {
                          if (value != null) {
                            // String sessionId = value['sessionId'];
                            // widget.sessionCallback(sessionId);

                            dynamic response = value['response'];
                            widget.sessionCallback(response);
                          }
                        });
                      });
                    },

                    // child:
                    //   Colors.black,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: const Size(300, 50),

                      // minimumSize: const Size.fromWidth(30),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Subscribe',
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Pay with "),
                            Image.asset(
                              'conscentplugin/assets/ConsCent-Logo.png',
                              height: 50,
                              width: 80,
                              // opacity:
                              //     const AlwaysStoppedAnimation<double>(0.5)
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //------------

  //---------

  @override
  void initState() {
    // TODO: implement initState
    controller1 = PageController(initialPage: pageIndex);
    doOnLaunch();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }
}

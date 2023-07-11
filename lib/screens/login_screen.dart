import 'dart:convert';

import 'package:demo_blog/conscent_sdk/constants.dart';
import 'package:demo_blog/utils/genrate_token_post.dart';
import 'package:demo_blog/utils/genrate_token_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../conscent_sdk/conscent_methods.dart';
import '../conscent_sdk/coreDb.dart';
import '../conscent_sdk/datamodel/getuser_detail.dart';
import '../conscent_sdk/web_view_default.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  late TextEditingController _controller;
  var phoneRegex = RegExp("^(?:\\d{10}|\\w+@\\w+\\.\\w{2,3})\$");
  var isValid = false;
  GetUserDetail? getusermain;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Future<bool> checkLogin() async {
    String? userId = await CoreDb.instance().getUserId();
    if (userId != null && userId.isNotEmpty) {
      Constants.logIn = true;
      getusermain = await ConscentMethods().getUser();
      setState(() {});
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkLogin(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: const Icon(
                      Icons.account_circle,
                      size: 200,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Text("${getusermain?.phoneNumber}"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        // textStyle: TextStyle(color: Colors.white)
                      ),
                      onPressed: () async {
                        String? logout = await ConscentMethods().userLogOut();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('$logout'),
                          ));
                        }
                        setState(() {});
                      },
                      child: Text("Logout"),
                    ),
                  )
                ],
              ),
            );
          } else if (!snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(64, 44, 64, 24),
                    child: Image.asset(
                      'assets/images/conscent.png',
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: Text(
                      "Welcome back!",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Text(
                      "Please enter your sign in details below",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Text(
                      "Sign In/Sign Up",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 24),
                    child: TextField(
                      onChanged: (String newText) => {
                        setState(() {}),
                        if (phoneRegex.hasMatch(newText))
                          {isValid = true}
                        else
                          {isValid = false}
                      },
                      controller: _controller,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'Mobile/Email',
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 24),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.blueAccent,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          minimumSize: const Size(5000, 65)),
                      onPressed: isValid ? () => submitData() : null,
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  submitData() async {
    print("generate-temp-token");
    // Do something here
    var emailPhone = _controller.text;
    var postBodyString = GenrateTokenPost();
    postBodyString.email = "";
    postBodyString.phoneNumber = _controller.text;

    String username = 'J1EFAQR-H0N4921-QCXKVNH-6W9ZYY9';
    String password =
        'CFR472795Q42TTQJFV84M37A5G4SJ1EFAQRH0N4921QCXKVNH6W9ZYY9';
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    var response = await http.post(
        Uri.parse('https://stage.tsbdev.co/api/v1/client/generate-temp-token'),
        headers: <String, String>{'authorization': basicAuth},
        body: postBodyString.toJson());
    if (response.statusCode == 201) {
      print("generate-temp-token");
      GenrateTokenResponse genrateTokenResponse =
          GenrateTokenResponse.fromJson(json.decode(response.body));

      String redirectUrl = await ConscentMethods().prepareAutoLoginUrl(
          [(genrateTokenResponse.tempAuthToken), (emailPhone), ("")]);

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  WebViewDefaultApp(redirectUrl: redirectUrl)),
        ).then((value) {
          setState(() {});
          if (kDebugMode) {
            print("response ${value[0].toString()}");
          }
          if (value != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$value'),
            ));
          }
        });
      }
    } else {
      print("generate-temp-token error ${response.body}");
    }
  }
}

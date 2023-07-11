// ignore: file_names
import 'dart:convert';

LoginChallengeget loginChallengegetFromJson(String str) =>
    LoginChallengeget.fromJson(json.decode(str));

String loginChallengegetToJson(LoginChallengeget data) =>
    json.encode(data.toJson());

class LoginChallengeget {
  String? loginChallengeId;
  String? sessionId;
  String? redirectTo;
  String? userId;

  LoginChallengeget(
      {this.loginChallengeId, this.sessionId, this.redirectTo, this.userId});

  LoginChallengeget.fromJson(Map<String, dynamic> json) {
    loginChallengeId = json['loginChallengeId'];
    sessionId = json['sessionId'];
    redirectTo = json['redirectTo'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loginChallengeId'] = loginChallengeId;
    data['sessionId'] = sessionId;
    data['redirectTo'] = redirectTo;
    data['userId'] = userId;
    return data;
  }
}

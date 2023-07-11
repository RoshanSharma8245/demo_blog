// ignore: file_names
import 'dart:convert';

LoginChallengepost loginChallengepostFromJson(String str) =>
    LoginChallengepost.fromJson(json.decode(str));

String loginChallengepostToJson(LoginChallengepost data) =>
    json.encode(data.toJson());

class LoginChallengepost {
  LoginChallengepost({
    required this.message,
    required this.loginChallengeId,
  });

  String message;
  String loginChallengeId;

  factory LoginChallengepost.fromJson(Map<String, dynamic> json) =>
      LoginChallengepost(
        message: json["message"] == null ? null : json["message"],
        loginChallengeId:
            json["loginChallengeId"] == null ? null : json["loginChallengeId"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "loginChallengeId": loginChallengeId == null ? null : loginChallengeId,
      };
}

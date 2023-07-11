import 'dart:convert';

AutoLoginResponse autoLoginResponseFromJson(String str) => AutoLoginResponse.fromJson(json.decode(str));

String autoLoginResponseToJson(AutoLoginResponse data) => json.encode(data.toJson());

class AutoLoginResponse {
  bool? status;
  String? message;
  String? token;
  String? email;
  String? userId;
  String? sessionId;

  AutoLoginResponse(
      {this.status,
        this.message,
        this.token,
        this.email,
        this.userId,
        this.sessionId});

  AutoLoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    email = json['email'];
    userId = json['userId'];
    sessionId = json['sessionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    data['email'] = this.email;
    data['userId'] = this.userId;
    data['sessionId'] = this.sessionId;
    return data;
  }
}
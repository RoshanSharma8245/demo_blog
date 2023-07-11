import 'dart:convert';

Logout logoutFromJson(String str) => Logout.fromJson(json.decode(str));

String logoutToJson(Logout data) => json.encode(data.toJson());

class Logout {
  Logout({
    required this.message,
    required this.error,
  });

  String? message;
  String? error;

  factory Logout.fromJson(Map<String, dynamic> json) => Logout(
    error: json["error"] == null ? null : json["error"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "error": error == null ? null : error,
      };
}

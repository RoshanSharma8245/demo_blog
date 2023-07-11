// ignore: file_names
import 'dart:convert';

ContentAccess contentAccessFromJson(String str) =>
    ContentAccess.fromJson(json.decode(str));

String contentAccessToJson(ContentAccess data) => json.encode(data.toJson());

class ContentAccess {
  ContentAccess({
    required this.sessionExists,
    required this.accessTimeLeft,
    required this.freeAccess,
  });

  bool sessionExists;
  int accessTimeLeft;
  bool freeAccess;

  factory ContentAccess.fromJson(Map<String, dynamic> json) => ContentAccess(
        sessionExists:
            json["sessionExists"] == null ? null : json["sessionExists"],
        accessTimeLeft:
            json["accessTimeLeft"] == null ? null : json["accessTimeLeft"],
        freeAccess: json["freeAccess"] == null ? null : json["freeAccess"],
      );

  Map<String, dynamic> toJson() => {
        "sessionExists": sessionExists == null ? null : sessionExists,
        "accessTimeLeft": accessTimeLeft == null ? null : accessTimeLeft,
        "freeAccess": freeAccess == null ? null : freeAccess,
      };
}

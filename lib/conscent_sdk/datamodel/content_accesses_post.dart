// To parse this JSON data, do
//
//     final contentAccesses = contentAccessesFromJson(jsonString);

import 'dart:convert';

ContentAccesses contentAccessesFromJson(String str) => ContentAccesses.fromJson(json.decode(str));

String contentAccessesToJson(ContentAccesses data) => json.encode(data.toJson());

class ContentAccesses {
  ContentAccesses({
    required this.sessionExists,
    required this.accessTimeLeft,
    required this.freeAccess,
    required this.isAdfreePurchased,
    required this.payload,
    required this.consumptionId,
    required this.signature,
    required this.downloadExists,
  });

  bool sessionExists;
  int accessTimeLeft;
  bool freeAccess;
  bool isAdfreePurchased;
  Payload payload;
  String consumptionId;
  String signature;
  bool downloadExists;

  factory ContentAccesses.fromJson(Map<String, dynamic> json) => ContentAccesses(
    sessionExists: json["sessionExists"] == null ? null : json["sessionExists"],
    accessTimeLeft: json["accessTimeLeft"] == null ? null : json["accessTimeLeft"],
    freeAccess: json["freeAccess"] == null ? null : json["freeAccess"],
    isAdfreePurchased: json["isAdfreePurchased"] == null ? null : json["isAdfreePurchased"],
    payload:  json["payload"] == null ? null : json["payload"],
    consumptionId: json["consumptionId"] == null ? null : json["consumptionId"],
    signature: json["signature"] == null ? null : json["signature"],
    downloadExists: json["downloadExists"] == null ? null : json["downloadExists"],
  );

  Map<String, dynamic> toJson() => {
    "sessionExists": sessionExists == null ? null : sessionExists,
    "accessTimeLeft": accessTimeLeft == null ? null : accessTimeLeft,
    "freeAccess": freeAccess == null ? null : freeAccess,
    "isAdfreePurchased": isAdfreePurchased == null ? null : isAdfreePurchased,
    "payload": payload == null ? null : payload.toJson(),
    "consumptionId": consumptionId == null ? null : consumptionId,
    "signature": signature == null ? null : signature,
    "downloadExists": downloadExists == null ? null : downloadExists,
  };
}

class Payload {
  Payload({
    required this.clientId,
    required this.contentId,
    required this.createdAt,
  });

  String clientId;
  String contentId;
  DateTime createdAt;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    clientId: json["clientId"] == null ? null : json["clientId"],
    contentId: json["contentId"] == null ? null : json["contentId"],
    createdAt:  DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "clientId": clientId == null ? null : clientId,
    "contentId": contentId == null ? null : contentId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
  };
}

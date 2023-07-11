class ContentAccessModel {
  bool? sessionExists;
  int? accessTimeLeft;
  bool? freeAccess;
  bool? isAdfreePurchased;
  Payload? payload;
  String? consumptionId;
  String? signature;
  bool? downloadExists;
  bool? unlockedWithPass;
  bool? unlockedWithSubscription;
  ContentAccessModel(
      {this.sessionExists,
      this.accessTimeLeft,
      this.freeAccess,
      this.isAdfreePurchased,
      this.payload,
      this.consumptionId,
      this.signature,
      this.downloadExists,
      this.unlockedWithPass,
      this.unlockedWithSubscription});

  ContentAccessModel.fromJson(Map<String, dynamic> json) {
    sessionExists = json['sessionExists'];
    accessTimeLeft = json['accessTimeLeft'];
    freeAccess = json['freeAccess'];
    isAdfreePurchased = json['isAdfreePurchased'];
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    consumptionId = json['consumptionId'];
    signature = json['signature'];
    downloadExists = json['downloadExists'];
    unlockedWithPass = json['unlockedWithPass'];
    unlockedWithSubscription = json['unlockedWithSubscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sessionExists'] = sessionExists;
    data['accessTimeLeft'] = accessTimeLeft;
    data['freeAccess'] = freeAccess;
    data['isAdfreePurchased'] = isAdfreePurchased;
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    data['consumptionId'] = consumptionId;
    data['signature'] = signature;
    data['downloadExists'] = downloadExists;
    data['unlockedWithPass'] = unlockedWithPass;
    data['unlockedWithSubscription'] = unlockedWithSubscription;
    return data;
  }
}

class Payload {
  String? clientId;
  String? contentId;
  String? createdAt;

  Payload({this.clientId, this.contentId, this.createdAt});

  Payload.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    contentId = json['contentId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['contentId'] = contentId;
    data['createdAt'] = createdAt;
    return data;
  }
}

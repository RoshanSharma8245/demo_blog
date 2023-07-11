class PaywallViewEvent {
  String? topic;
  List<MessageBody>? messageBody;

  PaywallViewEvent({this.topic, this.messageBody});

  PaywallViewEvent.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    if (json['messageBody'] != null) {
      messageBody = <MessageBody>[];
      json['messageBody'].forEach((v) {
        messageBody!.add(new MessageBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    if (this.messageBody != null) {
      data['messageBody'] = this.messageBody!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageBody {
  String? anonId;
  String? userId;
  String? clientId;
  String? contentId;
  String? deviceType;
  String? eventLocation;
  String? eventType;
  int? isCookieBlocked;
  String? mobileModel;
  int? numOfCta;
  String? osName;
  String? osVersion;
  String? paywallDisplayType;
  String? paywallId;
  String? paywallType;

  String? userAgent;

  MessageBody({
    this.anonId,
    this.userId,
    this.clientId,
    this.contentId,
    this.deviceType,
    this.eventLocation,
    this.eventType,
    this.isCookieBlocked,
    this.mobileModel,
    this.numOfCta,
    this.osName,
    this.osVersion,
    this.paywallDisplayType,
    this.paywallId,
    this.paywallType,
    this.userAgent,
  });

  MessageBody.fromJson(Map<String, dynamic> json) {
    anonId = json['anonId'];
    userId = json['userId'];
    clientId = json['clientId'];
    contentId = json['contentId'];
    deviceType = json['deviceType'];
    eventLocation = json['eventLocation'];
    eventType = json['eventType'];
    isCookieBlocked = json['isCookieBlocked'];
    mobileModel = json['mobileModel'];
    numOfCta = json['numOfCta'];
    osName = json['osName'];
    osVersion = json['osVersion'];
    paywallDisplayType = json['paywallDisplayType'];
    paywallId = json['paywallId'];
    paywallType = json['paywallType'];
    userAgent = json['userAgent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anonId'] = this.anonId;
    data['userId'] = this.userId;
    data['clientId'] = this.clientId;
    data['contentId'] = this.contentId;
    data['deviceType'] = this.deviceType;
    data['eventLocation'] = this.eventLocation;
    data['eventType'] = this.eventType;
    data['isCookieBlocked'] = this.isCookieBlocked;
    data['mobileModel'] = this.mobileModel;
    data['numOfCta'] = this.numOfCta;
    data['osName'] = this.osName;
    data['osVersion'] = this.osVersion;
    data['paywallDisplayType'] = this.paywallDisplayType;
    data['paywallId'] = this.paywallId;
    data['paywallType'] = this.paywallType;
    data['userAgent'] = this.userAgent;

    return data;
  }
}

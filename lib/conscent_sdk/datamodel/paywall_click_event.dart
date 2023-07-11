class PaywallClickEvent {
  String? topic;
  List<MessageBodyEvent>? messageBody;

  PaywallClickEvent({this.topic, this.messageBody});

  PaywallClickEvent.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    if (json['messageBody'] != null) {
      messageBody = <MessageBodyEvent>[];
      json['messageBody'].forEach((v) {
        messageBody!.add(new MessageBodyEvent.fromJson(v));
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

class MessageBodyEvent {
  String? browser;
  String? osVersion;
  String? osName;
  String? mobileModel;
  String? deviceType;
  String? userAgent;
  String? url;
  String? userSourceData;
  int? isCookieBlocked;
  String? anonId;
  String? userId;
  String? paywallId;
  int? numOfCta;
  String? paywallType;
  String? paywallDisplayType;
  String? contentId;
  String? clientId;
  String? eventType;
  String? eventLocation;
  String? clickAction;

  MessageBodyEvent(
      {this.browser,
      this.osVersion,
      this.osName,
      this.mobileModel,
      this.deviceType,
      this.userAgent,
      this.url,
      this.userSourceData,
      this.isCookieBlocked,
      this.anonId,
      this.userId,
      this.paywallId,
      this.numOfCta,
      this.paywallType,
      this.paywallDisplayType,
      this.contentId,
      this.clientId,
      this.eventType,
      this.eventLocation,
      this.clickAction});

  MessageBodyEvent.fromJson(Map<String, dynamic> json) {
    browser = json['browser'];
    osVersion = json['osVersion'];
    osName = json['osName'];
    mobileModel = json['mobileModel'];
    deviceType = json['deviceType'];
    userAgent = json['userAgent'];
    url = json['url'];
    userSourceData = json['userSourceData'];
    isCookieBlocked = json['isCookieBlocked'];
    anonId = json['anonId'];
    userId = json['userId'];
    paywallId = json['paywallId'];
    numOfCta = json['numOfCta'];
    paywallType = json['paywallType'];
    paywallDisplayType = json['paywallDisplayType'];
    contentId = json['contentId'];
    clientId = json['clientId'];
    eventType = json['eventType'];
    eventLocation = json['eventLocation'];
    clickAction = json['clickAction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['browser'] = this.browser;
    data['osVersion'] = this.osVersion;
    data['osName'] = this.osName;
    data['mobileModel'] = this.mobileModel;
    data['deviceType'] = this.deviceType;
    data['userAgent'] = this.userAgent;
    data['url'] = this.url;
    data['userSourceData'] = this.userSourceData;
    data['isCookieBlocked'] = this.isCookieBlocked;
    data['anonId'] = this.anonId;
    data['userId'] = this.userId;
    data['paywallId'] = this.paywallId;
    data['numOfCta'] = this.numOfCta;
    data['paywallType'] = this.paywallType;
    data['paywallDisplayType'] = this.paywallDisplayType;
    data['contentId'] = this.contentId;
    data['clientId'] = this.clientId;
    data['eventType'] = this.eventType;
    data['eventLocation'] = this.eventLocation;
    data['clickAction'] = this.clickAction;
    return data;
  }
}

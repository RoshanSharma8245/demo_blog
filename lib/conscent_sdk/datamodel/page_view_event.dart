class PageViewEvent {
  List<PageViewMessageBody>? PageViewmessageBody;

  PageViewEvent({this.PageViewmessageBody});

  PageViewEvent.fromJson(Map<String, dynamic> json) {
    if (json['messageBody'] != null) {
      PageViewmessageBody = <PageViewMessageBody>[];
      json['messageBody'].forEach((v) {
        PageViewmessageBody!.add(PageViewMessageBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (PageViewmessageBody != null) {
      data['messageBody'] =
          PageViewmessageBody!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PageViewMessageBody {
  String? anonId;
  String? eventType;
  String? eventLocation;
  String? deviceType;
  String? pageType;
  String? mobileModel;
  String? osVersion;
  int? isCookieBlocked;
  String? userType;
  int? scrollDepth;
  int? pageLength;
  String? clientId;
  String? contentId;
  bool? adblocker;
  bool? premiumContent;
  bool? unlockedStatus;
  String? accessType;
  String? url;
  String? osName;
  String? userSourceData;
  String? referrer;
  String? referrerUrl;
  String? browser;
  String? userAgent;
  String? userId;
  String? authorName;
  String? contentTitle;
  List<String>? contentTags;
  List<String>? contentSections;
  List<String>? contentCategories;

  PageViewMessageBody({
    this.anonId,
    this.eventType,
    this.eventLocation,
    this.deviceType,
    this.pageType,
    this.mobileModel,
    this.osVersion,
    this.isCookieBlocked,
    this.userType,
    this.scrollDepth,
    this.pageLength,
    this.clientId,
    this.contentId,
    this.adblocker,
    this.premiumContent,
    this.unlockedStatus,
    this.accessType,
    this.url,
    this.osName,
    this.userSourceData,
    this.referrer,
    this.referrerUrl,
    this.browser,
    this.userAgent,
    this.userId,
    this.authorName,
    this.contentTitle,
    this.contentTags,
    this.contentSections,
    this.contentCategories,
  });

  PageViewMessageBody.fromJson(Map<String, dynamic> json) {
    anonId = json['anonId'];
    eventType = json['eventType'];
    eventLocation = json['eventLocation'];
    deviceType = json['deviceType'];
    pageType = json['pageType'];
    mobileModel = json['mobileModel'];
    osVersion = json['osVersion'];
    isCookieBlocked = json['isCookieBlocked'];
    userType = json['userType'];
    scrollDepth = json['scrollDepth'];
    pageLength = json['pageLength'];
    clientId = json['clientId'];
    contentId = json['contentId'];
    adblocker = json['adblocker'];
    premiumContent = json['premiumContent'];
    unlockedStatus = json['unlockedStatus'];
    accessType = json['accessType'];
    url = json['url'];
    osName = json['osName'];
    userSourceData = json['userSourceData'];
    referrer = json['referrer'];
    referrerUrl = json['referrerUrl'];
    browser = json['browser'];
    userAgent = json['userAgent'];
    userId = json['userId'];
    authorName = json['authorName'];
    contentTitle = json['contentTitle'];
    contentTags = json['contentTags'].cast<String>();
    contentSections = json['contentSections'].cast<String>();
    contentCategories = json['contentCategories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anonId'] = this.anonId;
    data['eventType'] = this.eventType;
    data['eventLocation'] = this.eventLocation;
    data['deviceType'] = this.deviceType;
    data['pageType'] = this.pageType;
    data['mobileModel'] = this.mobileModel;
    data['osVersion'] = this.osVersion;
    data['isCookieBlocked'] = this.isCookieBlocked;
    data['userType'] = this.userType;
    data['scrollDepth'] = this.scrollDepth;
    data['pageLength'] = this.pageLength;
    data['clientId'] = this.clientId;
    data['contentId'] = this.contentId;
    data['adblocker'] = this.adblocker;
    data['premiumContent'] = this.premiumContent;
    data['unlockedStatus'] = this.unlockedStatus;
    data['accessType'] = this.accessType;
    data['url'] = this.url;
    data['osName'] = this.osName;
    data['userSourceData'] = this.userSourceData;
    data['referrer'] = this.referrer;
    data['referrerUrl'] = this.referrerUrl;
    data['browser'] = this.browser;
    data['userAgent'] = this.userAgent;
    data['userId'] = this.userId;
    data['authorName'] = this.authorName;
    data['contentTitle'] = this.contentTitle;
    data['contentTags'] = this.contentTags;
    data['contentSections'] = this.contentSections;
    data['contentCategories'] = this.contentCategories;
    return data;
  }
}

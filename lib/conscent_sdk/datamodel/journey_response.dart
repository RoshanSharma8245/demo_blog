class JourneyResponse {
  Content? content;
  bool? isPremium;
  ActionId? actionId;
  PopupAction? popupAction;
  String? consumptionId;
  String? signature;
  bool? unlockedWithPass;
  bool? unlockedWithSubscription;
  bool? sessionExists;
  bool? freeAccess;
  int? accessTimeLeft;
  bool? isAdfreePurchased;
  bool? unlockedWithContent;
  bool? unlockedWithRegwall;
  Payload? payload;
  bool? downloadExists;

  JourneyResponse(
      {this.content,
      this.isPremium,
      this.actionId,
      this.popupAction,
      this.sessionExists,
      this.accessTimeLeft,
      this.freeAccess,
      this.isAdfreePurchased,
      this.unlockedWithPass,
      this.unlockedWithSubscription,
      this.unlockedWithContent,
      this.unlockedWithRegwall,
      this.payload,
      this.consumptionId,
      this.signature,
      this.downloadExists});

  JourneyResponse.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    isPremium = json['isPremium'];
    actionId = json['actionId'] != null
        ? new ActionId.fromJson(json['actionId'])
        : null;
    popupAction = json['popupAction'] != null
        ? new PopupAction.fromJson(json['popupAction'])
        : null;

    sessionExists = json['sessionExists'];
    accessTimeLeft = json['accessTimeLeft'];
    freeAccess = json['freeAccess'];
    isAdfreePurchased = json['isAdfreePurchased'];
    unlockedWithPass = json['unlockedWithPass'];
    unlockedWithSubscription = json['unlockedWithSubscription'];
    unlockedWithContent = json['unlockedWithContent'];
    unlockedWithRegwall = json['unlockedWithRegwall'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    consumptionId = json['consumptionId'];
    signature = json['signature'];
    downloadExists = json['downloadExists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['isPremium'] = this.isPremium;
    if (this.actionId != null) {
      data['actionId'] = this.actionId!.toJson();
    }
    if (this.popupAction != null) {
      data['popupAction'] = this.popupAction!.toJson();
    }

    data['sessionExists'] = this.sessionExists;
    data['accessTimeLeft'] = this.accessTimeLeft;
    data['freeAccess'] = this.freeAccess;
    data['isAdfreePurchased'] = this.isAdfreePurchased;
    data['unlockedWithPass'] = this.unlockedWithPass;
    data['unlockedWithSubscription'] = this.unlockedWithSubscription;
    data['unlockedWithContent'] = this.unlockedWithContent;
    data['unlockedWithRegwall'] = this.unlockedWithRegwall;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['consumptionId'] = this.consumptionId;
    data['signature'] = this.signature;
    data['downloadExists'] = this.downloadExists;

    return data;
  }
}

class Content {
  PriceOverrides? priceOverrides;
  Pixels? pixels;
  List<String>? tags;
  List<String>? sections;
  bool? automaticallyCreated;
  bool? bundle;
  List<String>? bundleContentIds;
  List<String>? categories;
  bool? excludeFromSubscription;
  String? sId;
  String? clientId;
  String? clientContentId;
  String? title;
  String? subTitle;
  String? url;
  String? price;
  String? currency;
  String? duration;
  String? contentType;
  String? authorId;
  String? authorName;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Content(
      {this.priceOverrides,
      this.pixels,
      this.tags,
      this.sections,
      this.automaticallyCreated,
      this.bundle,
      this.bundleContentIds,
      this.categories,
      this.excludeFromSubscription,
      this.sId,
      this.clientId,
      this.clientContentId,
      this.title,
      this.subTitle,
      this.url,
      this.price,
      this.currency,
      this.duration,
      this.contentType,
      this.authorId,
      this.authorName,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Content.fromJson(Map<String, dynamic> json) {
    priceOverrides = json['priceOverrides'] != null
        ? new PriceOverrides.fromJson(json['priceOverrides'])
        : null;
    pixels =
        json['pixels'] != null ? new Pixels.fromJson(json['pixels']) : null;
    tags = json['tags'].cast<String>();
    sections = json['sections'].cast<String>();
    automaticallyCreated = json['automaticallyCreated'];
    bundle = json['bundle'];
    if (json['bundleContentIds'] != null) {
      bundleContentIds = <String>[];
      json['bundleContentIds'].forEach((v) {
        bundleContentIds!.add(v);
      });
    }
    if (json['categories'] != null) {
      categories = <String>[];
      json['categories'].forEach((v) {
        categories!.add(v);
      });
    }
    excludeFromSubscription = json['excludeFromSubscription'];
    sId = json['_id'];
    clientId = json['clientId'];
    clientContentId = json['clientContentId'];
    title = json['title'];
    subTitle = json['subTitle'];
    url = json['url'];
    price = json['price'];
    currency = json['currency'];
    duration = json['duration'];
    contentType = json['contentType'];
    authorId = json['authorId'];
    authorName = json['authorName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.priceOverrides != null) {
      data['priceOverrides'] = this.priceOverrides!.toJson();
    }
    if (this.pixels != null) {
      data['pixels'] = this.pixels!.toJson();
    }
    data['tags'] = this.tags;
    data['sections'] = this.sections;
    data['automaticallyCreated'] = this.automaticallyCreated;
    data['bundle'] = this.bundle;
    if (this.bundleContentIds != null) {
      data['bundleContentIds'] = this.bundleContentIds!.map((v) => v).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v).toList();
    }
    data['excludeFromSubscription'] = this.excludeFromSubscription;
    data['_id'] = this.sId;
    data['clientId'] = this.clientId;
    data['clientContentId'] = this.clientContentId;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['url'] = this.url;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['duration'] = this.duration;
    data['contentType'] = this.contentType;
    data['authorId'] = this.authorId;
    data['authorName'] = this.authorName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PriceOverrides {
  List<String>? country;

  PriceOverrides({this.country});

  PriceOverrides.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = <String>[];
      json['country'].forEach((v) {
        country!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country!.map((v) => v).toList();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
    data['contentId'] = this.contentId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Pixels {
  Facebook? facebook;

  Pixels({this.facebook});

  Pixels.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'] != null
        ? new Facebook.fromJson(json['facebook'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.facebook != null) {
      data['facebook'] = this.facebook!.toJson();
    }
    return data;
  }
}

class Facebook {
  List<String>? events;

  Facebook({this.events});

  Facebook.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <String>[];
      json['events'].forEach((v) {
        events!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v).toList();
    }
    return data;
  }
}

class ActionId {
  bool? isFallback;
  String? message;
  ActionIdData? data;

  ActionId({this.isFallback, this.message, this.data});

  ActionId.fromJson(Map<String, dynamic> json) {
    isFallback = json['isFallback'];
    message = json['message'];
    data = json['data'] != null ? ActionIdData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFallback'] = this.isFallback;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PopupAction {
  bool? isFallback;
  String? message;
  Data? data;

  PopupAction({this.isFallback, this.message, this.data});

  PopupAction.fromJson(Map<String, dynamic> json) {
    isFallback = json['isFallback'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFallback'] = this.isFallback;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ActionIdData {
  String? actionId;
  Conditions? conditions;

  ActionIdData({this.actionId, this.conditions});

  ActionIdData.fromJson(Map<String, dynamic> json) {
    actionId = json['actionId'];
    conditions = json['conditions'] != null
        ? new Conditions.fromJson(json['conditions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actionId'] = this.actionId;
    if (this.conditions != null) {
      data['conditions'] = this.conditions!.toJson();
    }
    return data;
  }
}

class Conditions {
  MobileScrollDepth? mobileScrollDepth;
  MobileScrollDepth? desktopScrollDepth;
  MobileScrollDepth? mobilePageLoad;
  MobileScrollDepth? desktopPageLoad;

  Conditions(
      {this.mobileScrollDepth,
      this.desktopScrollDepth,
      this.mobilePageLoad,
      this.desktopPageLoad});

  Conditions.fromJson(Map<String, dynamic> json) {
    mobileScrollDepth = json['mobileScrollDepth'] != null
        ? new MobileScrollDepth.fromJson(json['mobileScrollDepth'])
        : null;
    desktopScrollDepth = json['desktopScrollDepth'] != null
        ? new MobileScrollDepth.fromJson(json['desktopScrollDepth'])
        : null;
    mobilePageLoad = json['mobilePageLoad'] != null
        ? new MobileScrollDepth.fromJson(json['mobilePageLoad'])
        : null;
    desktopPageLoad = json['desktopPageLoad'] != null
        ? new MobileScrollDepth.fromJson(json['desktopPageLoad'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mobileScrollDepth != null) {
      data['mobileScrollDepth'] = this.mobileScrollDepth!.toJson();
    }
    if (this.desktopScrollDepth != null) {
      data['desktopScrollDepth'] = this.desktopScrollDepth!.toJson();
    }
    if (this.mobilePageLoad != null) {
      data['mobilePageLoad'] = this.mobilePageLoad!.toJson();
    }
    if (this.desktopPageLoad != null) {
      data['desktopPageLoad'] = this.desktopPageLoad!.toJson();
    }
    return data;
  }
}

class MobileScrollDepth {
  int? value;
  String? type;
  bool? enabled;

  MobileScrollDepth({this.value, this.type, this.enabled});

  MobileScrollDepth.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    type = json['type'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['type'] = this.type;
    data['enabled'] = this.enabled;
    return data;
  }
}

class Data {
  String? popupActionId;
  Conditions? conditions;

  Data({this.popupActionId, this.conditions});

  Data.fromJson(Map<String, dynamic> json) {
    popupActionId = json['popupActionId'];
    conditions = json['conditions'] != null
        ? new Conditions.fromJson(json['conditions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popupActionId'] = this.popupActionId;
    if (this.conditions != null) {
      data['conditions'] = this.conditions!.toJson();
    }
    return data;
  }
}

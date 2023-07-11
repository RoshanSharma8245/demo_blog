class ContentDetails2 {
  MicroPricing? microPricing;
  int? price;
  int? duration;
  String? currency;
  String? currencySymbol;
  String? clientName;
  String? url;
  String? title;
  String? contentType;
  CouponDetails? couponDetails;
  bool? downloadExists;
  bool? bundle;
  UserDetails? userDetails;
  Pixels? pixels;
  String? logoUrl;
  ValidPass? validPass;
  PaywallCustomization? paywallCustomization;
  bool? subscriptionsExist;
  String? subscriptionDomain;
  String? pathUrl;
  // List<Null>? categories;
  String? detectedCountry;
  CouponDetails? couponForPass;
  String? subscriptionUrl;

  ContentDetails2(
      {this.microPricing,
      this.price,
      this.duration,
      this.currency,
      this.currencySymbol,
      this.clientName,
      this.url,
      this.title,
      this.contentType,
      this.couponDetails,
      this.downloadExists,
      this.bundle,
      this.userDetails,
      this.pixels,
      this.logoUrl,
      this.validPass,
      this.paywallCustomization,
      this.subscriptionsExist,
      this.subscriptionDomain,
      this.pathUrl,
      // this.categories,
      this.detectedCountry,
      this.couponForPass,
      this.subscriptionUrl});

  ContentDetails2.fromJson(Map<String, dynamic> json) {
    microPricing = json['microPricing'] != null
        ? new MicroPricing.fromJson(json['microPricing'])
        : null;
    price = json['price'];
    duration = json['duration'];
    currency = json['currency'];
    currencySymbol = json['currencySymbol'];
    clientName = json['clientName'];
    url = json['url'];
    title = json['title'];
    contentType = json['contentType'];
    couponDetails = json['couponDetails'] != null
        ? new CouponDetails.fromJson(json['couponDetails'])
        : null;
    downloadExists = json['downloadExists'];
    bundle = json['bundle'];
    userDetails = json['userDetails'] != null
        ? new UserDetails.fromJson(json['userDetails'])
        : null;
    pixels =
        json['pixels'] != null ? new Pixels.fromJson(json['pixels']) : null;
    logoUrl = json['logoUrl'];
    validPass = json['validPass'] != null
        ? new ValidPass.fromJson(json['validPass'])
        : null;
    paywallCustomization = json['paywallCustomization'] != null
        ? new PaywallCustomization.fromJson(json['paywallCustomization'])
        : null;
    subscriptionsExist = json['subscriptionsExist'];
    subscriptionDomain = json['subscriptionDomain'];
    pathUrl = json['pathUrl'];
    // if (json['categories'] != null) {
    //   categories = <Null>[];
    //   json['categories'].forEach((v) {
    //     categories!.add(new Null.fromJson(v));
    //   });
    // }
    detectedCountry = json['detectedCountry'];
    couponForPass = json['couponForPass'] != null
        ? new CouponDetails.fromJson(json['couponForPass'])
        : null;
    subscriptionUrl = json['subscriptionUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.microPricing != null) {
      data['microPricing'] = this.microPricing!.toJson();
    }
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['currency'] = this.currency;
    data['currencySymbol'] = this.currencySymbol;
    data['clientName'] = this.clientName;
    data['url'] = this.url;
    data['title'] = this.title;
    data['contentType'] = this.contentType;
    if (this.couponDetails != null) {
      data['couponDetails'] = this.couponDetails!.toJson();
    }
    data['downloadExists'] = this.downloadExists;
    data['bundle'] = this.bundle;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails!.toJson();
    }
    if (this.pixels != null) {
      data['pixels'] = this.pixels!.toJson();
    }
    data['logoUrl'] = this.logoUrl;
    if (this.validPass != null) {
      data['validPass'] = this.validPass!.toJson();
    }
    if (this.paywallCustomization != null) {
      data['paywallCustomization'] = this.paywallCustomization!.toJson();
    }
    data['subscriptionsExist'] = this.subscriptionsExist;
    data['subscriptionDomain'] = this.subscriptionDomain;
    data['pathUrl'] = this.pathUrl;
    // if (this.categories != null) {
    //   data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    // }
    data['detectedCountry'] = this.detectedCountry;
    if (this.couponForPass != null) {
      data['couponForPass'] = this.couponForPass!.toJson();
    }
    data['subscriptionUrl'] = this.subscriptionUrl;
    return data;
  }
}

class MicroPricing {
  int? price;
  int? duration;

  MicroPricing({this.price, this.duration});

  MicroPricing.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['duration'] = this.duration;
    return data;
  }
}

class CouponDetails {
  String? code;
  bool? newUsersOnly;

  CouponDetails({this.newUsersOnly, this.code});

  CouponDetails.fromJson(Map<String, dynamic> json) {
    newUsersOnly = json['newUsersOnly'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newUsersOnly'] = newUsersOnly;
    data['code'] = code;
    return data;
  }
}

class UserDetails {
  String? sId;
  Wallet? wallet;
  List<Null>? usedCoupons;
  List<Null>? ampReaderIds;
  String? phoneNumber;
  String? lastPurchasedOn;
  String? country;
  String? userCurrency;
  String? name;

  UserDetails(
      {this.sId,
      this.wallet,
      this.usedCoupons,
      this.ampReaderIds,
      this.phoneNumber,
      this.lastPurchasedOn,
      this.country,
      this.userCurrency,
      this.name});

  UserDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    // if (json['usedCoupons'] != null) {
    //   usedCoupons = <Null>[];
    //   json['usedCoupons'].forEach((v) {
    //     usedCoupons!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['ampReaderIds'] != null) {
    //   ampReaderIds = <Null>[];
    //   json['ampReaderIds'].forEach((v) {
    //     ampReaderIds!.add(new Null.fromJson(v));
    //   });
    // }
    phoneNumber = json['phoneNumber'];
    lastPurchasedOn = json['lastPurchasedOn'];
    country = json['country'];
    userCurrency = json['userCurrency'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    // if (this.usedCoupons != null) {
    //   data['usedCoupons'] = this.usedCoupons!.map((v) => v.toJson()).toList();
    // }
    // if (this.ampReaderIds != null) {
    //   data['ampReaderIds'] = this.ampReaderIds!.map((v) => v.toJson()).toList();
    // }
    data['phoneNumber'] = this.phoneNumber;
    data['lastPurchasedOn'] = this.lastPurchasedOn;
    data['country'] = this.country;
    data['userCurrency'] = this.userCurrency;
    data['name'] = this.name;
    return data;
  }
}

class Wallet {
  Balance? balance;
  String? currency;

  Wallet({this.balance, this.currency});

  Wallet.fromJson(Map<String, dynamic> json) {
    balance =
        json['balance'] != null ? Balance.fromJson(json['balance']) : null;
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (balance != null) {
      data['balance'] = balance!.toJson();
    }
    data['currency'] = currency;
    return data;
  }
}

class Balance {
  String? numberDecimal;

  Balance({this.numberDecimal});

  Balance.fromJson(Map<String, dynamic> json) {
    numberDecimal = json['\u0024numberDecimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['\u0024numberDecimal'] = numberDecimal;
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
  List<Null>? events;

  Facebook({this.events});

  Facebook.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      // events = <Null>[];
      // json['events'].forEach((v) {
      //   events!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      // data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ValidPass {
  String? title;
  int? price;
  int? duration;
  String? currency;

  ValidPass({this.title, this.price, this.duration, this.currency});

  ValidPass.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    duration = json['duration'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['currency'] = this.currency;
    return data;
  }
}

class PaywallCustomization {
  ButtonStyle? buttonStyle;
  String? micropaymentDisplaytext;
  String? subscriptionText;
  String? subscriptionTitle;
  String? crossButtonClickUrl;
  String? brandLogoUrl;

  PaywallCustomization(
      {this.buttonStyle,
      this.micropaymentDisplaytext,
      this.subscriptionText,
      this.subscriptionTitle,
      this.crossButtonClickUrl,
      this.brandLogoUrl});

  PaywallCustomization.fromJson(Map<String, dynamic> json) {
    buttonStyle = json['buttonStyle'] != null
        ? new ButtonStyle.fromJson(json['buttonStyle'])
        : null;
    micropaymentDisplaytext = json['micropaymentDisplaytext'];
    subscriptionText = json['subscriptionText'];
    subscriptionTitle = json['subscriptionTitle'];
    crossButtonClickUrl = json['crossButtonClickUrl'];
    brandLogoUrl = json['brandLogoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.buttonStyle != null) {
      data['buttonStyle'] = this.buttonStyle!.toJson();
    }
    data['micropaymentDisplaytext'] = this.micropaymentDisplaytext;
    data['subscriptionText'] = this.subscriptionText;
    data['subscriptionTitle'] = this.subscriptionTitle;
    data['crossButtonClickUrl'] = this.crossButtonClickUrl;
    data['brandLogoUrl'] = this.brandLogoUrl;
    return data;
  }
}

class ButtonStyle {
  String? color;
  String? backgroundColor;

  ButtonStyle({this.color, this.backgroundColor});

  ButtonStyle.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    backgroundColor = json['backgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['backgroundColor'] = this.backgroundColor;
    return data;
  }
}

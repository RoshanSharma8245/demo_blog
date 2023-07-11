class Embedded {
  String? title;
  List<Subscriptions>? subscriptions;

  Embedded({this.title, this.subscriptions});

  Embedded.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(Subscriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscriptions {
  FreeTrial? freeTrial;
  String? benefits;
  bool? physical;
  bool? digital;
  bool? adFree;
  bool? migrated;
  bool? couponsEnabled;
  String? adminCoupon;
  List<Null>? usedCouponNumbers;
  String? sId;
  bool? recommended;
  bool? enabled;
  String? clientId;
  String? title;
  String? iconUrl;
  List<Tiers>? tiers;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? couponCount;
  String? currencySymbol;

  Subscriptions(
      {this.freeTrial,
        this.benefits,
        this.physical,
        this.digital,
        this.adFree,
        this.migrated,
        this.couponsEnabled,
        this.adminCoupon,
        this.usedCouponNumbers,
        this.sId,
        this.recommended,
        this.enabled,
        this.clientId,
        this.title,
        this.iconUrl,
        this.tiers,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.couponCount,
        this.currencySymbol});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    freeTrial = json['freeTrial'] != null
        ? FreeTrial.fromJson(json['freeTrial'])
        : null;
    benefits = json['benefits'];
    physical = json['physical'];
    digital = json['digital'];
    adFree = json['adFree'];
    migrated = json['migrated'];
    couponsEnabled = json['couponsEnabled'];
    adminCoupon = json['adminCoupon'];
    if (json['usedCouponNumbers'] != null) {
      usedCouponNumbers = <Null>[];
      json['usedCouponNumbers'].forEach((v) {
      //  usedCouponNumbers!.add(new Null.fromJson(v));
      });
    }
    sId = json['_id'];
    recommended = json['recommended'];
    enabled = json['enabled'];
    clientId = json['clientId'];
    title = json['title'];
    iconUrl = json['iconUrl'];
    if (json['tiers'] != null) {
      tiers = <Tiers>[];
      json['tiers'].forEach((v) {
        tiers!.add(Tiers.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    couponCount = json['couponCount'];
    currencySymbol = json['currencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.freeTrial != null) {
      data['freeTrial'] = this.freeTrial!.toJson();
    }
    data['benefits'] = this.benefits;
    data['physical'] = this.physical;
    data['digital'] = this.digital;
    data['adFree'] = this.adFree;
    data['migrated'] = this.migrated;
    data['couponsEnabled'] = this.couponsEnabled;
    data['adminCoupon'] = this.adminCoupon;
    if (this.usedCouponNumbers != null) {
    //  data['usedCouponNumbers'] =
      //    this.usedCouponNumbers!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['recommended'] = this.recommended;
    data['enabled'] = this.enabled;
    data['clientId'] = this.clientId;
    data['title'] = this.title;
    data['iconUrl'] = this.iconUrl;
    if (this.tiers != null) {
      data['tiers'] = this.tiers!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['couponCount'] = this.couponCount;
    data['currencySymbol'] = this.currencySymbol;
    return data;
  }
}

class FreeTrial {
  bool? enabled;
  int? duration;

  FreeTrial({this.enabled, this.duration});

  FreeTrial.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['enabled'] = this.enabled;
    data['duration'] = this.duration;
    return data;
  }
}

class Tiers {
  PriceOverrides? priceOverrides;
  String? currency;
  double? basePrice;
  List<Offers>? offers;
  String? sId;
  int? price;
  int? duration;

  Tiers(
      {this.priceOverrides,
        this.currency,
        this.basePrice,
        this.offers,
        this.sId,
        this.price,
        this.duration});

  Tiers.fromJson(Map<String, dynamic> json) {
    priceOverrides = json['priceOverrides'] != null
        ? PriceOverrides.fromJson(json['priceOverrides'])
        : null;
    currency = json['currency'];
    basePrice = json['basePrice'].toDouble();
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
    sId = json['_id'];
    price = json['price'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.priceOverrides != null) {
      data['priceOverrides'] = this.priceOverrides!.toJson();
    }
    data['currency'] = this.currency;
    data['basePrice'] = this.basePrice;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['duration'] = this.duration;
    return data;
  }
}

class PriceOverrides {
  List<Null>? country;

  PriceOverrides({this.country});

  PriceOverrides.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = <Null>[];
      json['country'].forEach((v) {
      //  country!.add(Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.country != null) {
      //data['country'] = this.country!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  String? sId;
  String? title;
  String? benefits;
  String? iconUrl;

  Offers({this.sId, this.title, this.benefits, this.iconUrl});

  Offers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    benefits = json['benefits'];
    iconUrl = json['iconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['benefits'] = this.benefits;
    data['iconUrl'] = this.iconUrl;
    return data;
  }
}
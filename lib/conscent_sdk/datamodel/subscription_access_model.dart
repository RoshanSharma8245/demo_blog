

import 'dart:convert';

SubscriptionAccess subscriptionAccessFromJson(String str) =>
    SubscriptionAccess.fromJson(json.decode(str));

String subscriptionAccessToJson(SubscriptionAccess data) =>
    json.encode(data.toJson());

class SubscriptionAccess {
  bool? subscriptionAlreadyPurchased;
  List<PurchasedSubscriptions>? purchasedSubscriptions;
  bool? freeTrialConsumed;
  bool? allowRenewal;
  bool? internalUser;
  Payload? payload;
  String? consumptionId;
  String? signature;
  bool? downloadExists;

  SubscriptionAccess(
      {this.subscriptionAlreadyPurchased,
        this.purchasedSubscriptions,
        this.freeTrialConsumed,
        this.allowRenewal,
        this.internalUser,
        this.payload,
        this.consumptionId,
        this.signature,
        this.downloadExists});

  SubscriptionAccess.fromJson(Map<String, dynamic> json) {
    subscriptionAlreadyPurchased = json['subscriptionAlreadyPurchased'];
    if (json['purchasedSubscriptions'] != null) {
      purchasedSubscriptions = <PurchasedSubscriptions>[];
      json['purchasedSubscriptions'].forEach((v) {
        purchasedSubscriptions!.add(new PurchasedSubscriptions.fromJson(v));
      });
    }
    freeTrialConsumed = json['freeTrialConsumed'];
    allowRenewal = json['allowRenewal'];
    internalUser = json['internalUser'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    consumptionId = json['consumptionId'];
    signature = json['signature'];
    downloadExists = json['downloadExists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscriptionAlreadyPurchased'] = this.subscriptionAlreadyPurchased;
    if (this.purchasedSubscriptions != null) {
      data['purchasedSubscriptions'] =
          this.purchasedSubscriptions!.map((v) => v.toJson()).toList();
    }
    data['freeTrialConsumed'] = this.freeTrialConsumed;
    data['allowRenewal'] = this.allowRenewal;
    data['internalUser'] = this.internalUser;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['consumptionId'] = this.consumptionId;
    data['signature'] = this.signature;
    data['downloadExists'] = this.downloadExists;
    return data;
  }
}

class PurchasedSubscriptions {
  String? purchasedDate;
  String? validity;
  PriceDetails? priceDetails;
  List? offerDetails;
  Subscription? subscription;
  SubscriptionDetails? subscriptionDetails;

  PurchasedSubscriptions(
      {this.purchasedDate,
        this.validity,
        this.priceDetails,
        this.offerDetails,
        this.subscription,
        this.subscriptionDetails});

  PurchasedSubscriptions.fromJson(Map<String, dynamic> json) {
    purchasedDate = json['purchasedDate'];
    validity = json['validity'];
    priceDetails = json['priceDetails'] != null
        ? new PriceDetails.fromJson(json['priceDetails'])
        : null;
    if (json['offerDetails'] != null) {
      offerDetails = [];
      if (json['offerDetails']!= null){
        json['offerDetails'].forEach((v) {
          offerDetails!.add(v);
        });
      }

    }
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
    subscriptionDetails = json['subscriptionDetails'] != null
        ? new SubscriptionDetails.fromJson(json['subscriptionDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purchasedDate'] = this.purchasedDate;
    data['validity'] = this.validity;
    if (this.priceDetails != null) {
      data['priceDetails'] = this.priceDetails!.toJson();
    }
    if (this.offerDetails != null) {
      data['offerDetails'] = this.offerDetails!.map((v) => v.toJson()).toList();
    }
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    if (this.subscriptionDetails != null) {
      data['subscriptionDetails'] = this.subscriptionDetails!.toJson();
    }
    return data;
  }
}

class PriceDetails {
  int? amount;
  String? currency;

  PriceDetails({this.amount, this.currency});

  PriceDetails.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}

class Subscription {
  String? tierId;
  bool? digital;
  bool? physical;
  bool? adFree;
  String? title;
  bool? renew;
  int? duration;
  String? durationText;

  Subscription(
      {this.tierId,
        this.digital,
        this.physical,
        this.adFree,
        this.title,
        this.renew,
        this.duration,
        this.durationText});

  Subscription.fromJson(Map<String, dynamic> json) {
    tierId = json['tierId'];
    digital = json['digital'];
    physical = json['physical'];
    adFree = json['adFree'];
    title = json['title'];
    renew = json['renew'];
    duration = json['duration'];
    durationText = json['durationText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tierId'] = this.tierId;
    data['digital'] = this.digital;
    data['physical'] = this.physical;
    data['adFree'] = this.adFree;
    data['title'] = this.title;
    data['renew'] = this.renew;
    data['duration'] = this.duration;
    data['durationText'] = this.durationText;
    return data;
  }
}

class SubscriptionDetails {
  FreeTrial? freeTrial;
  String? benefits;
  bool? physical;
  bool? digital;
  bool? adFree;
  bool? migrated;
  bool? couponsEnabled;
  String? adminCoupon;
  List? usedCouponNumbers;
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

  SubscriptionDetails(
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

  SubscriptionDetails.fromJson(Map<String, dynamic> json) {
    freeTrial = json['freeTrial'] != null
        ? new FreeTrial.fromJson(json['freeTrial'])
        : null;
    benefits = json['benefits'];
    physical = json['physical'];
    digital = json['digital'];
    adFree = json['adFree'];
    migrated = json['migrated'];
    couponsEnabled = json['couponsEnabled'];
    adminCoupon = json['adminCoupon'];
    if (json['usedCouponNumbers'] != null) {
      usedCouponNumbers = [];
      if (  json['usedCouponNumbers']!= null){
        json['usedCouponNumbers'].forEach((v) {
          usedCouponNumbers!.add(v);
        });
      }


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
        tiers!.add(new Tiers.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    couponCount = json['couponCount'];
    currencySymbol = json['currencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
      data['usedCouponNumbers'] =
          this.usedCouponNumbers!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enabled'] = this.enabled;
    data['duration'] = this.duration;
    return data;
  }
}

class Tiers {
  PriceOverrides? priceOverrides;
  String? currency;
  int? basePrice;
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
        ? new PriceOverrides.fromJson(json['priceOverrides'])
        : null;
    currency = json['currency'];
    basePrice = json['basePrice'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
    sId = json['_id'];
    price = json['price'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  List? country;

  PriceOverrides({this.country});

  PriceOverrides.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = [];
      if ( json['country']!= null){
        json['country'].forEach((v) {
          country!.add(v);
        });
      }

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['benefits'] = this.benefits;
    data['iconUrl'] = this.iconUrl;
    return data;
  }
}

class Payload {
  String? clientId;
  String? subscriptionId;
  String? createdAt;

  Payload({this.clientId, this.subscriptionId, this.createdAt});

  Payload.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    subscriptionId = json['subscriptionId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
    data['subscriptionId'] = this.subscriptionId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

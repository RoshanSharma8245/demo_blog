// To parse this JSON data, do
//
//     final embeddedSubscribtion = embeddedSubscribtionFromJson(jsonString);

import 'dart:convert';

EmbeddedSubscribtion embeddedSubscribtionFromJson(String str) =>
    EmbeddedSubscribtion.fromJson(json.decode(str));

String embeddedSubscribtionToJson(EmbeddedSubscribtion data) =>
    json.encode(data.toJson());

class EmbeddedSubscribtion {
  EmbeddedSubscribtion({
    required this.title,
    required this.subscriptions,
    required this.recommended,
  });

  String title;
  List<Subscription> subscriptions;
  String recommended;

  factory EmbeddedSubscribtion.fromJson(Map<String, dynamic> json) =>
      EmbeddedSubscribtion(
        title: json["title"] == null ? null : json["title"],
        subscriptions: List<Subscription>.from(
            json["subscriptions"].map((x) => Subscription.fromJson(x))),
        recommended: json["recommended"] == null ? null : json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "subscriptions": subscriptions == null
            ? null
            : List<dynamic>.from(subscriptions.map((x) => x.toJson())),
        "recommended": recommended == null ? null : recommended,
      };
}

class Subscription {
  Subscription({
    required this.freeTrial,
    required this.benefits,
    required this.physical,
    required this.digital,
    required this.adFree,
    required this.migrated,
    required this.couponsEnabled,
    required this.adminCoupon,
    required this.usedCouponNumbers,
    required this.id,
    required this.recommended,
    required this.enabled,
    required this.clientId,
    required this.title,
    required this.iconUrl,
    required this.tiers,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.couponCount,
    required this.currencySymbol,
  });

  FreeTrial freeTrial;
  String benefits;
  bool physical;
  bool digital;
  bool adFree;
  bool migrated;
  bool couponsEnabled;
  String adminCoupon;
  List<dynamic> usedCouponNumbers;
  String id;
  bool recommended;
  bool enabled;
  String clientId;
  String title;
  String iconUrl;
  List<Tier> tiers;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int couponCount;
  String currencySymbol;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        freeTrial: FreeTrial.fromJson(json["freeTrial"]),
        benefits: json["benefits"] == null ? null : json["benefits"],
        physical: json["physical"] == null ? null : json["physical"],
        digital: json["digital"] == null ? null : json["digital"],
        adFree: json["adFree"] == null ? null : json["adFree"],
        migrated: json["migrated"] == null ? null : json["migrated"],
        couponsEnabled:
            json["couponsEnabled"] == null ? null : json["couponsEnabled"],
        adminCoupon: json["adminCoupon"] == null ? null : json["adminCoupon"],
        usedCouponNumbers:
            List<dynamic>.from(json["usedCouponNumbers"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
        recommended: json["recommended"] == null ? null : json["recommended"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        clientId: json["clientId"] == null ? null : json["clientId"],
        title: json["title"] == null ? null : json["title"],
        iconUrl: json["iconUrl"] == null ? null : json["iconUrl"],
        tiers: List<Tier>.from(json["tiers"].map((x) => Tier.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        couponCount: json["couponCount"] == null ? null : json["couponCount"],
        currencySymbol:
            json["currencySymbol"] == null ? null : json["currencySymbol"],
      );

  Map<String, dynamic> toJson() => {
        "freeTrial": freeTrial == null ? null : freeTrial.toJson(),
        "benefits": benefits == null ? null : benefits,
        "physical": physical == null ? null : physical,
        "digital": digital == null ? null : digital,
        "adFree": adFree == null ? null : adFree,
        "migrated": migrated == null ? null : migrated,
        "couponsEnabled": couponsEnabled == null ? null : couponsEnabled,
        "adminCoupon": adminCoupon == null ? null : adminCoupon,
        "usedCouponNumbers": usedCouponNumbers == null
            ? null
            : List<dynamic>.from(usedCouponNumbers.map((x) => x)),
        "_id": id == null ? null : id,
        "recommended": recommended == null ? null : recommended,
        "enabled": enabled == null ? null : enabled,
        "clientId": clientId == null ? null : clientId,
        "title": title == null ? null : title,
        "iconUrl": iconUrl == null ? null : iconUrl,
        "tiers": tiers == null
            ? null
            : List<dynamic>.from(tiers.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "couponCount": couponCount == null ? null : couponCount,
        "currencySymbol": currencySymbol == null ? null : currencySymbol,
      };
}

class FreeTrial {
  FreeTrial({
    required this.enabled,
    required this.duration,
  });

  bool enabled;
  dynamic duration;

  factory FreeTrial.fromJson(Map<String, dynamic> json) => FreeTrial(
        enabled: json["enabled"] == null ? null : json["enabled"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled == null ? null : enabled,
        "duration": duration,
      };
}

class Tier {
  Tier({
    required this.priceOverrides,
    required this.currency,
    required this.basePrice,
    required this.offers,
    required this.id,
    required this.price,
    required this.duration,
  });

  PriceOverrides priceOverrides;
  String currency;
  double basePrice;
  List<Offer> offers;
  String id;
  double price;
  int duration;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
        priceOverrides: PriceOverrides.fromJson(json["priceOverrides"]),
        currency: json["currency"],
        basePrice:
            json["basePrice"] == null ? null : json["basePrice"].toDouble(),
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
        id: json["_id"] == null ? null : json["_id"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        duration: json["duration"] == null ? null : json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "priceOverrides":
            priceOverrides == null ? null : priceOverrides.toJson(),
        "currency": [currency],
        "basePrice": basePrice == null ? null : basePrice,
        "offers": offers == null
            ? null
            : List<dynamic>.from(offers.map((x) => x.toJson())),
        "_id": id == null ? null : id,
        "price": price == null ? null : price,
        "duration": duration == null ? null : duration,
      };
}

// enum Currency { INR }

// final currencyValues = EnumValues({"INR": Currency.INR});

class Offer {
  Offer({
    required this.id,
    required this.title,
    required this.benefits,
    required this.iconUrl,
  });

  String id;
  String title;
  String benefits;
  String iconUrl;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        benefits: json["benefits"] == null ? null : json["benefits"],
        iconUrl: json["iconUrl"] == null ? null : json["iconUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "benefits": benefits == null ? null : benefits,
        "iconUrl": iconUrl == null ? null : iconUrl,
      };
}

class PriceOverrides {
  PriceOverrides({
    required this.country,
  });

  List<dynamic> country;

  factory PriceOverrides.fromJson(Map<String, dynamic> json) => PriceOverrides(
        country: List<dynamic>.from(json["country"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "country":
            country == null ? null : List<dynamic>.from(country.map((x) => x)),
      };
}

class EnumValues<T> {
  // EnumValues(Map<String, Currency> map);

  // Map<String, T> map;
  // Map<T, String> reverseMap;

  // EnumValues(this.map);

  // Map<T, String> get reverse {
  //   if (reverseMap == null) {
  //     reverseMap = map.map((k, v) => new MapEntry(v, k));
  //   }
  //   return reverseMap;
  // }

}

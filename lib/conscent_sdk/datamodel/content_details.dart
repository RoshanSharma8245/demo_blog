// To parse this JSON data, do
//
//     final contentDetails = contentDetailsFromJson(jsonString);

import 'dart:convert';

ContentDetails contentDetailsFromJson(String str) =>
    ContentDetails.fromJson(json.decode(str));

String contentDetailsToJson(ContentDetails data) => json.encode(data.toJson());

class ContentDetails {
  ContentDetails({
    required this.microPricing,
    required this.price,
    required this.duration,
    required this.currency,
    required this.currencySymbol,
    required this.clientName,
    required this.url,
    required this.title,
    required this.contentType,
    required this.couponDetails,
    required this.downloadExists,
    required this.bundle,
    required this.pixels,
    required this.logoUrl,
    required this.validPass,
    required this.paywallCustomization,
    required this.subscriptionsExist,
    required this.subscriptionDomain,
    required this.pathUrl,
    required this.categories,
    required this.detectedCountry,
    required this.couponForPass,
    required this.subscriptionUrl,
  });

  MicroPricing microPricing;
  int price;
  int duration;
  String currency;
  String currencySymbol;
  String clientName;
  String url;
  String title;
  String contentType;
  Coupon couponDetails;
  bool downloadExists;
  bool bundle;
  Pixels pixels;
  String logoUrl;
  ValidPass validPass;
  PaywallCustomization paywallCustomization;
  bool subscriptionsExist;
  String subscriptionDomain;
  String pathUrl;
  List<dynamic> categories;
  String detectedCountry;
  Coupon couponForPass;
  String subscriptionUrl;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        microPricing: MicroPricing.fromJson(json["microPricing"]),
        price: json["price"] == null ? null : json["price"],
        duration: json["duration"] == null ? null : json["duration"],
        currency: json["currency"] == null ? null : json["currency"],
        currencySymbol:
            json["currencySymbol"] == null ? null : json["currencySymbol"],
        clientName: json["clientName"] == null ? null : json["clientName"],
        url: json["url"] == null ? null : json["url"],
        title: json["title"] == null ? null : json["title"],
        contentType: json["contentType"] == null ? null : json["contentType"],
        couponDetails: Coupon.fromJson(json["couponDetails"]),
        downloadExists:
            json["downloadExists"] == null ? null : json["downloadExists"],
        bundle: json["bundle"] == null ? null : json["bundle"],
        pixels: Pixels.fromJson(json["pixels"]),
        logoUrl: json["logoUrl"] == null ? null : json["logoUrl"],
        validPass: ValidPass.fromJson(json["validPass"]),
        paywallCustomization:
            PaywallCustomization.fromJson(json["paywallCustomization"]),
        subscriptionsExist: json["subscriptionsExist"] == null
            ? null
            : json["subscriptionsExist"],
        subscriptionDomain: json["subscriptionDomain"] == null
            ? null
            : json["subscriptionDomain"],
        pathUrl: json["pathUrl"] == null ? null : json["pathUrl"],
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        detectedCountry:
            json["detectedCountry"] == null ? null : json["detectedCountry"],
        couponForPass: Coupon.fromJson(json["couponForPass"]),
        subscriptionUrl:
            json["subscriptionUrl"] == null ? null : json["subscriptionUrl"],
      );

  Map<String, dynamic> toJson() => {
        "microPricing": microPricing == null ? null : microPricing.toJson(),
        "price": price == null ? null : price,
        "duration": duration == null ? null : duration,
        "currency": currency == null ? null : currency,
        "currencySymbol": currencySymbol == null ? null : currencySymbol,
        "clientName": clientName == null ? null : clientName,
        "url": url == null ? null : url,
        "title": title == null ? null : title,
        "contentType": contentType == null ? null : contentType,
        "couponDetails": couponDetails == null ? null : couponDetails.toJson(),
        "downloadExists": downloadExists == null ? null : downloadExists,
        "bundle": bundle == null ? null : bundle,
        "pixels": pixels == null ? null : pixels.toJson(),
        "logoUrl": logoUrl == null ? null : logoUrl,
        "validPass": validPass == null ? null : validPass.toJson(),
        "paywallCustomization":
            paywallCustomization == null ? null : paywallCustomization.toJson(),
        "subscriptionsExist":
            subscriptionsExist == null ? null : subscriptionsExist,
        "subscriptionDomain":
            subscriptionDomain == null ? null : subscriptionDomain,
        "pathUrl": pathUrl == null ? null : pathUrl,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x)),
        "detectedCountry": detectedCountry == null ? null : detectedCountry,
        "couponForPass": couponForPass == null ? null : couponForPass.toJson(),
        "subscriptionUrl": subscriptionUrl == null ? null : subscriptionUrl,
      };
}

class Coupon {
  Coupon({
    required this.code,
    required this.newUsersOnly,
  });

  dynamic code;
  bool newUsersOnly;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        code: json["code"],
        newUsersOnly:
            json["newUsersOnly"] == null ? null : json["newUsersOnly"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "newUsersOnly": newUsersOnly == null ? null : newUsersOnly,
      };
}

class MicroPricing {
  MicroPricing({
    required this.price,
    required this.duration,
  });

  int price;
  int duration;

  factory MicroPricing.fromJson(Map<String, dynamic> json) => MicroPricing(
        price: json["price"] == null ? null : json["price"],
        duration: json["duration"] == null ? null : json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? null : price,
        "duration": duration == null ? null : duration,
      };
}

class PaywallCustomization {
  PaywallCustomization({
    required this.buttonStyle,
    required this.micropaymentDisplaytext,
    required this.subscriptionText,
    required this.subscriptionTitle,
    required this.crossButtonClickUrl,
    required this.brandLogoUrl,
  });

  ButtonStyle buttonStyle;
  String micropaymentDisplaytext;
  String subscriptionText;
  String subscriptionTitle;
  String crossButtonClickUrl;
  String brandLogoUrl;

  factory PaywallCustomization.fromJson(Map<String, dynamic> json) =>
      PaywallCustomization(
        buttonStyle: ButtonStyle.fromJson(json["buttonStyle"]),
        micropaymentDisplaytext: json["micropaymentDisplaytext"] == null
            ? null
            : json["micropaymentDisplaytext"],
        subscriptionText:
            json["subscriptionText"] == null ? null : json["subscriptionText"],
        subscriptionTitle: json["subscriptionTitle"] == null
            ? null
            : json["subscriptionTitle"],
        crossButtonClickUrl: json["crossButtonClickUrl"] == null
            ? null
            : json["crossButtonClickUrl"],
        brandLogoUrl:
            json["brandLogoUrl"] == null ? null : json["brandLogoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "buttonStyle": buttonStyle == null ? null : buttonStyle.toJson(),
        "micropaymentDisplaytext":
            micropaymentDisplaytext == null ? null : micropaymentDisplaytext,
        "subscriptionText": subscriptionText == null ? null : subscriptionText,
        "subscriptionTitle":
            subscriptionTitle == null ? null : subscriptionTitle,
        "crossButtonClickUrl":
            crossButtonClickUrl == null ? null : crossButtonClickUrl,
        "brandLogoUrl": brandLogoUrl == null ? null : brandLogoUrl,
      };
}

class ButtonStyle {
  ButtonStyle({
    required this.color,
  });

  String color;

  factory ButtonStyle.fromJson(Map<String, dynamic> json) => ButtonStyle(
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "color": color == null ? null : color,
      };
}

class Pixels {
  Pixels({
    required this.facebook,
  });

  Facebook facebook;

  factory Pixels.fromJson(Map<String, dynamic> json) => Pixels(
        facebook: Facebook.fromJson(json["facebook"]),
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook == null ? null : facebook.toJson(),
      };
}

class Facebook {
  Facebook({
    required this.events,
  });

  List<dynamic> events;

  factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
        events: List<dynamic>.from(json["events"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "events":
            events == null ? null : List<dynamic>.from(events.map((x) => x)),
      };
}

class ValidPass {
  ValidPass({
    required this.title,
    required this.price,
    required this.duration,
    required this.currency,
  });

  String title;
  int price;
  int duration;
  String currency;

  factory ValidPass.fromJson(Map<String, dynamic> json) => ValidPass(
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"],
        duration: json["duration"] == null ? null : json["duration"],
        currency: json["currency"] == null ? null : json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "duration": duration == null ? null : duration,
        "currency": currency == null ? null : currency,
      };
}

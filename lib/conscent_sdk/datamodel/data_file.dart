// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

DataMainPage dataFromJson(String str) =>
    DataMainPage.fromJson(json.decode(str));

String dataToJson(DataMainPage data) => json.encode(data.toJson());

class DataMainPage {
  DataMainPage({
    this.microPricing,
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
    this.pixels,
    this.logoUrl,
    this.validPass,
    this.paywallCustomization,
    this.subscriptionsExist,
    this.subscriptionDomain,
    this.pathUrl,
    this.categories,
    this.detectedCountry,
    this.couponForPass,
    this.subscriptionUrl,
  });

  MicroPricing? microPricing;
  int? price;
  int? duration;
  String? currency;
  String? currencySymbol;
  String? clientName;
  String? url;
  String? title;
  String? contentType;
  Coupon? couponDetails;
  bool? downloadExists;
  bool? bundle;
  Pixels? pixels;
  String? logoUrl;
  ValidPass? validPass;
  PaywallCustomization? paywallCustomization;
  bool? subscriptionsExist;
  String? subscriptionDomain;
  String? pathUrl;
  List<dynamic>? categories;
  String? detectedCountry;
  Coupon? couponForPass;
  String? subscriptionUrl;

  factory DataMainPage.fromJson(Map<String, dynamic> json) => DataMainPage(
        microPricing: MicroPricing.fromJson(json["microPricing"]),
        price: json["price"],
        duration: json["duration"],
        currency: json["currency"],
        currencySymbol: json["currencySymbol"],
        clientName: json["clientName"],
        url: json["url"],
        title: json["title"],
        contentType: json["contentType"],
        couponDetails: Coupon.fromJson(json["couponDetails"]),
        downloadExists: json["downloadExists"],
        bundle: json["bundle"],
        pixels: Pixels.fromJson(json["pixels"]),
        logoUrl: json["logoUrl"],
        validPass: ValidPass.fromJson(json["validPass"]),
        paywallCustomization:
            PaywallCustomization.fromJson(json["paywallCustomization"]),
        subscriptionsExist: json["subscriptionsExist"],
        subscriptionDomain: json["subscriptionDomain"],
        pathUrl: json["pathUrl"],
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        detectedCountry: json["detectedCountry"],
        couponForPass: Coupon.fromJson(json["couponForPass"]),
        subscriptionUrl: json["subscriptionUrl"],
      );

  Map<String, dynamic> toJson() => {
        "microPricing": microPricing?.toJson(),
        "price": price,
        "duration": duration,
        "currency": currency,
        "currencySymbol": currencySymbol,
        "clientName": clientName,
        "url": url,
        "title": title,
        "contentType": contentType,
        "couponDetails": couponDetails?.toJson(),
        "downloadExists": downloadExists,
        "bundle": bundle,
        "pixels": pixels?.toJson(),
        "logoUrl": logoUrl,
        "validPass": validPass?.toJson(),
        "paywallCustomization": paywallCustomization?.toJson(),
        "subscriptionsExist": subscriptionsExist,
        "subscriptionDomain": subscriptionDomain,
        "pathUrl": pathUrl,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "detectedCountry": detectedCountry,
        "couponForPass": couponForPass?.toJson(),
        "subscriptionUrl": subscriptionUrl,
      };
}

class Coupon {
  Coupon({
    this.code,
    this.newUsersOnly,
  });

  dynamic code;
  bool? newUsersOnly;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        code: json["code"],
        newUsersOnly: json["newUsersOnly"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "newUsersOnly": newUsersOnly,
      };
}

class MicroPricing {
  MicroPricing({
    this.price,
    this.duration,
  });

  int? price;
  int? duration;

  factory MicroPricing.fromJson(Map<String, dynamic> json) => MicroPricing(
        price: json["price"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "duration": duration,
      };
}

class PaywallCustomization {
  PaywallCustomization({
    this.buttonStyle,
    this.micropaymentDisplaytext,
    this.subscriptionText,
    this.subscriptionTitle,
    this.crossButtonClickUrl,
    this.brandLogoUrl,
  });

  ButtonStyle? buttonStyle;
  String? micropaymentDisplaytext;
  String? subscriptionText;
  String? subscriptionTitle;
  String? crossButtonClickUrl;
  String? brandLogoUrl;

  factory PaywallCustomization.fromJson(Map<String, dynamic> json) =>
      PaywallCustomization(
        buttonStyle: ButtonStyle.fromJson(json["buttonStyle"]),
        micropaymentDisplaytext: json["micropaymentDisplaytext"],
        subscriptionText: json["subscriptionText"],
        subscriptionTitle: json["subscriptionTitle"],
        crossButtonClickUrl: json["crossButtonClickUrl"],
        brandLogoUrl: json["brandLogoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "buttonStyle": buttonStyle?.toJson(),
        "micropaymentDisplaytext": micropaymentDisplaytext,
        "subscriptionText": subscriptionText,
        "subscriptionTitle": subscriptionTitle,
        "crossButtonClickUrl": crossButtonClickUrl,
        "brandLogoUrl": brandLogoUrl,
      };
}

class ButtonStyle {
  ButtonStyle({
    this.color,
    this.backgroundColor,
  });

  String? color;
  String? backgroundColor;

  factory ButtonStyle.fromJson(Map<String, dynamic> json) => ButtonStyle(
        color: json["color"],
        backgroundColor: json["backgroundColor"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "backgroundColor": backgroundColor,
      };
}

class Pixels {
  Pixels({
    this.facebook,
  });

  Facebook? facebook;

  factory Pixels.fromJson(Map<String, dynamic> json) => Pixels(
        facebook: Facebook.fromJson(json["facebook"]),
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook?.toJson(),
      };
}

class Facebook {
  Facebook({
    this.events,
  });

  List<dynamic>? events;

  factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
        events: List<dynamic>.from(json["events"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events!.map((x) => x)),
      };
}

class ValidPass {
  ValidPass({
    this.title,
    this.price,
    this.duration,
    this.currency,
  });

  String? title;
  int? price;
  int? duration;
  String? currency;

  factory ValidPass.fromJson(Map<String, dynamic> json) => ValidPass(
        title: json["title"],
        price: json["price"],
        duration: json["duration"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "duration": duration,
        "currency": currency,
      };
}

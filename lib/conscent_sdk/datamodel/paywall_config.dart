class PaywallConfig {
  bool? isFallback;
  String? message;
  Data? data;

  PaywallConfig({this.isFallback, this.message, this.data});

  PaywallConfig.fromJson(Map<String, dynamic> json) {
    isFallback = json['isFallback'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  Configuration? configuration;
  String? state;
  bool? enable;
  String? sId;
  String? clientId;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.configuration,
      this.state,
      this.enable,
      this.sId,
      this.clientId,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    configuration = json['configuration'] != null
        ? new Configuration.fromJson(json['configuration'])
        : null;
    state = json['state'];
    enable = json['enable'];
    sId = json['_id'];
    clientId = json['clientId'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.configuration != null) {
      data['configuration'] = this.configuration!.toJson();
    }
    data['state'] = this.state;
    data['enable'] = this.enable;
    data['_id'] = this.sId;
    data['clientId'] = this.clientId;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Configuration {
  Desktop? desktop;
  Desktop? mobile;

  Configuration({this.desktop, this.mobile});

  Configuration.fromJson(Map<String, dynamic> json) {
    desktop =
        json['desktop'] != null ? new Desktop.fromJson(json['desktop']) : null;
    mobile =
        json['mobile'] != null ? new Desktop.fromJson(json['mobile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.desktop != null) {
      data['desktop'] = this.desktop!.toJson();
    }
    if (this.mobile != null) {
      data['mobile'] = this.mobile!.toJson();
    }
    return data;
  }
}

class Desktop {
  TemplateId? templateId;
  String? content;
  String? display;
  Json? json;
  String? key;
  String? url;

  Desktop(
      {this.templateId,
      this.content,
      this.display,
      this.json,
      this.key,
      this.url});

  Desktop.fromJson(Map<String, dynamic> json) {
    templateId = json['templateId'] != null
        ? new TemplateId.fromJson(json['templateId'])
        : null;
    content = json['content'];
    display = json['display'];
    this.json = (json['json'] != null ? new Json.fromJson(json['json']) : null);
    key = json['key'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.templateId != null) {
      data['templateId'] = this.templateId!.toJson();
    }
    data['content'] = this.content;
    data['display'] = this.display;
    if (this.json != null) {
      data['json'] = this.json!.toJson();
    }
    data['key'] = this.key;
    data['url'] = this.url;
    return data;
  }
}

class TemplateId {
  String? sId;
  String? name;
  String? paywallType;
  String? displayType;
  String? deviceType;
  int? numberOfCta;
  String? previewLink;
  Meta? meta;

  TemplateId(
      {this.sId,
      this.name,
      this.paywallType,
      this.displayType,
      this.deviceType,
      this.numberOfCta,
      this.previewLink,
      this.meta});

  TemplateId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    paywallType = json['paywallType'];
    displayType = json['displayType'];
    deviceType = json['deviceType'];
    numberOfCta = json['number_of_cta'];
    previewLink = json['previewLink'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['paywallType'] = this.paywallType;
    data['displayType'] = this.displayType;
    data['deviceType'] = this.deviceType;
    data['number_of_cta'] = this.numberOfCta;
    data['previewLink'] = this.previewLink;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Meta {
  String? whenToUse;
  String? howItHelps;
  String? possibleTriggers;

  Meta({this.whenToUse, this.howItHelps, this.possibleTriggers});

  Meta.fromJson(Map<String, dynamic> json) {
    whenToUse = json['when_to_use'];
    howItHelps = json['how_it_helps'];
    possibleTriggers = json['possible_triggers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['when_to_use'] = this.whenToUse;
    data['how_it_helps'] = this.howItHelps;
    data['possible_triggers'] = this.possibleTriggers;
    return data;
  }
}

class Json {
  StyleForBackground? styleForBackground;
  StyleForText? styleForText;
  SlotData? slotData;
  StyleForBtn? styleForBtn;

  Json(
      {this.styleForBackground,
      this.styleForText,
      this.slotData,
      this.styleForBtn});

  Json.fromJson(Map<String, dynamic> json) {
    styleForBackground = json['styleForBackground'] != null
        ? new StyleForBackground.fromJson(json['styleForBackground'])
        : null;
    styleForText = json['styleForText'] != null
        ? new StyleForText.fromJson(json['styleForText'])
        : null;
    slotData = json['slotData'] != null
        ? new SlotData.fromJson(json['slotData'])
        : null;
    styleForBtn = json['styleForBtn'] != null
        ? new StyleForBtn.fromJson(json['styleForBtn'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.styleForBackground != null) {
      data['styleForBackground'] = this.styleForBackground!.toJson();
    }
    if (this.styleForText != null) {
      data['styleForText'] = this.styleForText!.toJson();
    }
    if (this.slotData != null) {
      data['slotData'] = this.slotData!.toJson();
    }
    if (this.styleForBtn != null) {
      data['styleForBtn'] = this.styleForBtn!.toJson();
    }
    return data;
  }
}

class StyleForBackground {
  PaywallBorder? border;

  StyleForBackground({this.border});

  StyleForBackground.fromJson(Map<String, dynamic> json) {
    border = json['border'] != null
        ? new PaywallBorder.fromJson(json['border'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.border != null) {
      data['border'] = this.border!.toJson();
    }
    return data;
  }
}

class PaywallBorder {
  MainDiv? mainDiv;
  MainDiv? mainSubmitBtn;
  MainDiv? contentDivBtn;
  MainDiv? contentDiv;
  MainDiv? passDivBtn;
  MainDiv? passDiv;
  MainDiv? subDivBtn;
  MainDiv? subDiv;
  MainSubmitBtn? timerDiv;
  MainSubmitBtn? showRecommended;
  MainDiv? contentHeader;
  MainDiv? passHeader;
  MainDiv? subscriptionHeader;

  PaywallBorder(
      {this.mainDiv,
      this.mainSubmitBtn,
      this.contentDivBtn,
      this.contentDiv,
      this.passDivBtn,
      this.passDiv,
      this.subDivBtn,
      this.subDiv,
      this.timerDiv,
      this.showRecommended,
      this.contentHeader,
      this.passHeader,
      this.subscriptionHeader});

  PaywallBorder.fromJson(Map<String, dynamic> json) {
    mainDiv =
        json['mainDiv'] != null ? new MainDiv.fromJson(json['mainDiv']) : null;
    mainSubmitBtn = json['mainSubmitBtn'] != null
        ? new MainDiv.fromJson(json['mainSubmitBtn'])
        : null;
    contentDivBtn = json['contentDivBtn'] != null
        ? new MainDiv.fromJson(json['contentDivBtn'])
        : null;
    contentDiv = json['contentDiv'] != null
        ? new MainDiv.fromJson(json['contentDiv'])
        : null;
    passDivBtn = json['passDivBtn'] != null
        ? new MainDiv.fromJson(json['passDivBtn'])
        : null;
    passDiv =
        json['passDiv'] != null ? new MainDiv.fromJson(json['passDiv']) : null;
    subDivBtn = json['subDivBtn'] != null
        ? new MainDiv.fromJson(json['subDivBtn'])
        : null;
    subDiv =
        json['subDiv'] != null ? new MainDiv.fromJson(json['subDiv']) : null;
    timerDiv = json['timerDiv'] != null
        ? new MainSubmitBtn.fromJson(json['timerDiv'])
        : null;
    showRecommended = json['showRecommended'] != null
        ? new MainSubmitBtn.fromJson(json['showRecommended'])
        : null;
    contentHeader = json['contentHeader'] != null
        ? new MainDiv.fromJson(json['contentHeader'])
        : null;
    passHeader = json['passHeader'] != null
        ? new MainDiv.fromJson(json['passHeader'])
        : null;
    subscriptionHeader = json['subscriptionHeader'] != null
        ? new MainDiv.fromJson(json['subscriptionHeader'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainDiv != null) {
      data['mainDiv'] = this.mainDiv!.toJson();
    }
    if (this.mainSubmitBtn != null) {
      data['mainSubmitBtn'] = this.mainSubmitBtn!.toJson();
    }
    if (this.contentDivBtn != null) {
      data['contentDivBtn'] = this.contentDivBtn!.toJson();
    }
    if (this.contentDiv != null) {
      data['contentDiv'] = this.contentDiv!.toJson();
    }
    if (this.passDivBtn != null) {
      data['passDivBtn'] = this.passDivBtn!.toJson();
    }
    if (this.passDiv != null) {
      data['passDiv'] = this.passDiv!.toJson();
    }
    if (this.subDivBtn != null) {
      data['subDivBtn'] = this.subDivBtn!.toJson();
    }
    if (this.subDiv != null) {
      data['subDiv'] = this.subDiv!.toJson();
    }
    if (this.timerDiv != null) {
      data['timerDiv'] = this.timerDiv!.toJson();
    }
    if (this.showRecommended != null) {
      data['showRecommended'] = this.showRecommended!.toJson();
    }
    if (this.contentHeader != null) {
      data['contentHeader'] = this.contentHeader!.toJson();
    }
    if (this.passHeader != null) {
      data['passHeader'] = this.passHeader!.toJson();
    }
    if (this.subscriptionHeader != null) {
      data['subscriptionHeader'] = this.subscriptionHeader!.toJson();
    }
    return data;
  }
}

class MainDiv {
  String? border;
  String? borderRadius;
  String? backgroundColor;
  int? borderWidthValue;
  String? borderWidth;
  int? radius;
  String? borderColor;
  String? borderStyle;

  MainDiv(
      {this.border,
      this.borderRadius,
      this.backgroundColor,
      this.borderWidthValue,
      this.borderWidth,
      this.radius,
      this.borderColor,
      this.borderStyle});

  MainDiv.fromJson(Map<String, dynamic> json) {
    border = json['border'];
    borderRadius = json['borderRadius'];
    backgroundColor = json['backgroundColor'];
    borderWidthValue = json['borderWidthValue'];
    borderWidth = json['borderWidth'];
    radius = json['radius'];
    borderColor = json['borderColor'];
    borderStyle = json['borderStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['border'] = this.border;
    data['borderRadius'] = this.borderRadius;
    data['backgroundColor'] = this.backgroundColor;
    data['borderWidthValue'] = this.borderWidthValue;
    data['borderWidth'] = this.borderWidth;
    data['radius'] = this.radius;
    data['borderColor'] = this.borderColor;
    data['borderStyle'] = this.borderStyle;
    return data;
  }
}

class StyleForText {
  Typography? typography;

  StyleForText({this.typography});

  StyleForText.fromJson(Map<String, dynamic> json) {
    typography = json['typography'] != null
        ? new Typography.fromJson(json['typography'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.typography != null) {
      data['typography'] = this.typography!.toJson();
    }
    return data;
  }
}

class Typography {
  Heading? heading;
  Heading? subHeading;
  MainSubmitBtn? mainSubmitBtn;
  MainSubmitBtn? contentDivBtn;
  Heading? contentDivTitle;
  Heading? contentDivDiscription;
  Heading? contentDivPrice;
  Heading? contentDivCutPrice;
  Heading? contentDivSymbolPrice;
  Heading? contentDivSymbolCutPrice;
  MainSubmitBtn? passDivBtn;
  Heading? passDivTitle;
  Heading? passDivDiscription;
  Heading? passDivPrice;
  Heading? passDivCutPrice;
  Heading? passDivSymbolPrice;
  Heading? passDivSymbolCutPrice;
  MainSubmitBtn? subDivBtn;
  Heading? subDivTitle;
  Heading? subDivDiscription;
  Heading? subDivPrice;
  Heading? subscriptionDivCutPrice;
  Heading? subscriptionDivSymbolPrice;
  Heading? subscriptionDivSymbolCutPrice;
  Heading? couponLeftText;
  Heading? couponRightText;
  Heading? alreadyLeftText;
  Heading? conscentBalance;
  Heading? priceText;
  Heading? cutPriceText;
  Heading? loginText;
  MainSubmitBtn? timerDiv;
  MainSubmitBtn? showRecommended;
  MainSubmitBtn? contentHeader;
  MainSubmitBtn? passHeader;
  MainSubmitBtn? subscriptionHeader;

  Typography(
      {this.heading,
      this.subHeading,
      this.mainSubmitBtn,
      this.contentDivBtn,
      this.contentDivTitle,
      this.contentDivDiscription,
      this.contentDivPrice,
      this.contentDivCutPrice,
      this.contentDivSymbolPrice,
      this.contentDivSymbolCutPrice,
      this.passDivBtn,
      this.passDivTitle,
      this.passDivDiscription,
      this.passDivPrice,
      this.passDivCutPrice,
      this.passDivSymbolPrice,
      this.passDivSymbolCutPrice,
      this.subDivBtn,
      this.subDivTitle,
      this.subDivDiscription,
      this.subDivPrice,
      this.subscriptionDivCutPrice,
      this.subscriptionDivSymbolPrice,
      this.subscriptionDivSymbolCutPrice,
      this.couponLeftText,
      this.couponRightText,
      this.alreadyLeftText,
      this.conscentBalance,
      this.priceText,
      this.cutPriceText,
      this.loginText,
      this.timerDiv,
      this.showRecommended,
      this.contentHeader,
      this.passHeader,
      this.subscriptionHeader});

  Typography.fromJson(Map<String, dynamic> json) {
    heading =
        json['heading'] != null ? new Heading.fromJson(json['heading']) : null;
    subHeading = json['subHeading'] != null
        ? new Heading.fromJson(json['subHeading'])
        : null;
    mainSubmitBtn = json['mainSubmitBtn'] != null
        ? new MainSubmitBtn.fromJson(json['mainSubmitBtn'])
        : null;
    contentDivBtn = json['contentDivBtn'] != null
        ? new MainSubmitBtn.fromJson(json['contentDivBtn'])
        : null;
    contentDivTitle = json['contentDivTitle'] != null
        ? new Heading.fromJson(json['contentDivTitle'])
        : null;
    contentDivDiscription = json['contentDivDiscription'] != null
        ? new Heading.fromJson(json['contentDivDiscription'])
        : null;
    contentDivPrice = json['contentDivPrice'] != null
        ? new Heading.fromJson(json['contentDivPrice'])
        : null;
    contentDivCutPrice = json['contentDivCutPrice'] != null
        ? new Heading.fromJson(json['contentDivCutPrice'])
        : null;
    contentDivSymbolPrice = json['contentDivSymbolPrice'] != null
        ? new Heading.fromJson(json['contentDivSymbolPrice'])
        : null;
    contentDivSymbolCutPrice = json['contentDivSymbolCutPrice'] != null
        ? new Heading.fromJson(json['contentDivSymbolCutPrice'])
        : null;
    passDivBtn = json['passDivBtn'] != null
        ? new MainSubmitBtn.fromJson(json['passDivBtn'])
        : null;
    passDivTitle = json['passDivTitle'] != null
        ? new Heading.fromJson(json['passDivTitle'])
        : null;
    passDivDiscription = json['passDivDiscription'] != null
        ? new Heading.fromJson(json['passDivDiscription'])
        : null;
    passDivPrice = json['passDivPrice'] != null
        ? new Heading.fromJson(json['passDivPrice'])
        : null;
    passDivCutPrice = json['passDivCutPrice'] != null
        ? new Heading.fromJson(json['passDivCutPrice'])
        : null;
    passDivSymbolPrice = json['passDivSymbolPrice'] != null
        ? new Heading.fromJson(json['passDivSymbolPrice'])
        : null;
    passDivSymbolCutPrice = json['passDivSymbolCutPrice'] != null
        ? new Heading.fromJson(json['passDivSymbolCutPrice'])
        : null;
    subDivBtn = json['subDivBtn'] != null
        ? new MainSubmitBtn.fromJson(json['subDivBtn'])
        : null;
    subDivTitle = json['subDivTitle'] != null
        ? new Heading.fromJson(json['subDivTitle'])
        : null;
    subDivDiscription = json['subDivDiscription'] != null
        ? new Heading.fromJson(json['subDivDiscription'])
        : null;
    subDivPrice = json['subDivPrice'] != null
        ? new Heading.fromJson(json['subDivPrice'])
        : null;
    subscriptionDivCutPrice = json['subscriptionDivCutPrice'] != null
        ? new Heading.fromJson(json['subscriptionDivCutPrice'])
        : null;
    subscriptionDivSymbolPrice = json['subscriptionDivSymbolPrice'] != null
        ? new Heading.fromJson(json['subscriptionDivSymbolPrice'])
        : null;
    subscriptionDivSymbolCutPrice =
        json['subscriptionDivSymbolCutPrice'] != null
            ? new Heading.fromJson(json['subscriptionDivSymbolCutPrice'])
            : null;
    couponLeftText = json['couponLeftText'] != null
        ? new Heading.fromJson(json['couponLeftText'])
        : null;
    couponRightText = json['couponRightText'] != null
        ? new Heading.fromJson(json['couponRightText'])
        : null;
    alreadyLeftText = json['AlreadyLeftText'] != null
        ? new Heading.fromJson(json['AlreadyLeftText'])
        : null;
    conscentBalance = json['conscentBalance'] != null
        ? new Heading.fromJson(json['conscentBalance'])
        : null;
    priceText = json['priceText'] != null
        ? new Heading.fromJson(json['priceText'])
        : null;
    cutPriceText = json['CutPriceText'] != null
        ? new Heading.fromJson(json['CutPriceText'])
        : null;
    loginText = json['loginText'] != null
        ? new Heading.fromJson(json['loginText'])
        : null;
    timerDiv = json['timerDiv'] != null
        ? new MainSubmitBtn.fromJson(json['timerDiv'])
        : null;
    showRecommended = json['showRecommended'] != null
        ? new MainSubmitBtn.fromJson(json['showRecommended'])
        : null;
    contentHeader = json['contentHeader'] != null
        ? new MainSubmitBtn.fromJson(json['contentHeader'])
        : null;
    passHeader = json['passHeader'] != null
        ? new MainSubmitBtn.fromJson(json['passHeader'])
        : null;
    subscriptionHeader = json['subscriptionHeader'] != null
        ? new MainSubmitBtn.fromJson(json['subscriptionHeader'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.heading != null) {
      data['heading'] = this.heading!.toJson();
    }
    if (this.subHeading != null) {
      data['subHeading'] = this.subHeading!.toJson();
    }
    if (this.mainSubmitBtn != null) {
      data['mainSubmitBtn'] = this.mainSubmitBtn!.toJson();
    }
    if (this.contentDivBtn != null) {
      data['contentDivBtn'] = this.contentDivBtn!.toJson();
    }
    if (this.contentDivTitle != null) {
      data['contentDivTitle'] = this.contentDivTitle!.toJson();
    }
    if (this.contentDivDiscription != null) {
      data['contentDivDiscription'] = this.contentDivDiscription!.toJson();
    }
    if (this.contentDivPrice != null) {
      data['contentDivPrice'] = this.contentDivPrice!.toJson();
    }
    if (this.contentDivCutPrice != null) {
      data['contentDivCutPrice'] = this.contentDivCutPrice!.toJson();
    }
    if (this.contentDivSymbolPrice != null) {
      data['contentDivSymbolPrice'] = this.contentDivSymbolPrice!.toJson();
    }
    if (this.contentDivSymbolCutPrice != null) {
      data['contentDivSymbolCutPrice'] =
          this.contentDivSymbolCutPrice!.toJson();
    }
    if (this.passDivBtn != null) {
      data['passDivBtn'] = this.passDivBtn!.toJson();
    }
    if (this.passDivTitle != null) {
      data['passDivTitle'] = this.passDivTitle!.toJson();
    }
    if (this.passDivDiscription != null) {
      data['passDivDiscription'] = this.passDivDiscription!.toJson();
    }
    if (this.passDivPrice != null) {
      data['passDivPrice'] = this.passDivPrice!.toJson();
    }
    if (this.passDivCutPrice != null) {
      data['passDivCutPrice'] = this.passDivCutPrice!.toJson();
    }
    if (this.passDivSymbolPrice != null) {
      data['passDivSymbolPrice'] = this.passDivSymbolPrice!.toJson();
    }
    if (this.passDivSymbolCutPrice != null) {
      data['passDivSymbolCutPrice'] = this.passDivSymbolCutPrice!.toJson();
    }
    if (this.subDivBtn != null) {
      data['subDivBtn'] = this.subDivBtn!.toJson();
    }
    if (this.subDivTitle != null) {
      data['subDivTitle'] = this.subDivTitle!.toJson();
    }
    if (this.subDivDiscription != null) {
      data['subDivDiscription'] = this.subDivDiscription!.toJson();
    }
    if (this.subDivPrice != null) {
      data['subDivPrice'] = this.subDivPrice!.toJson();
    }
    if (this.subscriptionDivCutPrice != null) {
      data['subscriptionDivCutPrice'] = this.subscriptionDivCutPrice!.toJson();
    }
    if (this.subscriptionDivSymbolPrice != null) {
      data['subscriptionDivSymbolPrice'] =
          this.subscriptionDivSymbolPrice!.toJson();
    }
    if (this.subscriptionDivSymbolCutPrice != null) {
      data['subscriptionDivSymbolCutPrice'] =
          this.subscriptionDivSymbolCutPrice!.toJson();
    }
    if (this.couponLeftText != null) {
      data['couponLeftText'] = this.couponLeftText!.toJson();
    }
    if (this.couponRightText != null) {
      data['couponRightText'] = this.couponRightText!.toJson();
    }
    if (this.alreadyLeftText != null) {
      data['AlreadyLeftText'] = this.alreadyLeftText!.toJson();
    }
    if (this.conscentBalance != null) {
      data['conscentBalance'] = this.conscentBalance!.toJson();
    }
    if (this.priceText != null) {
      data['priceText'] = this.priceText!.toJson();
    }
    if (this.cutPriceText != null) {
      data['CutPriceText'] = this.cutPriceText!.toJson();
    }
    if (this.loginText != null) {
      data['loginText'] = this.loginText!.toJson();
    }
    if (this.timerDiv != null) {
      data['timerDiv'] = this.timerDiv!.toJson();
    }
    if (this.showRecommended != null) {
      data['showRecommended'] = this.showRecommended!.toJson();
    }
    if (this.contentHeader != null) {
      data['contentHeader'] = this.contentHeader!.toJson();
    }
    if (this.passHeader != null) {
      data['passHeader'] = this.passHeader!.toJson();
    }
    if (this.subscriptionHeader != null) {
      data['subscriptionHeader'] = this.subscriptionHeader!.toJson();
    }
    return data;
  }
}

class Heading {
  String? text;
  String? textAlign;
  String? textDecoration;
  String? textTransform;
  String? fontStyle;
  String? fontFamily;
  String? fontWeight;
  String? color;

  Heading(
      {this.text,
      this.textAlign,
      this.textDecoration,
      this.textTransform,
      this.fontStyle,
      this.fontFamily,
      this.fontWeight,
      this.color});

  Heading.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    textAlign = json['textAlign'];
    textDecoration = json['textDecoration'];
    textTransform = json['textTransform'];
    fontStyle = json['fontStyle'];
    fontFamily = json['fontFamily'];
    fontWeight = json['fontWeight'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['textAlign'] = this.textAlign;
    data['textDecoration'] = this.textDecoration;
    data['textTransform'] = this.textTransform;
    data['fontStyle'] = this.fontStyle;
    data['fontFamily'] = this.fontFamily;
    data['fontWeight'] = this.fontWeight;
    data['color'] = this.color;
    return data;
  }
}

class SlotData {
  Slot? slot;

  SlotData({this.slot});

  SlotData.fromJson(Map<String, dynamic> json) {
    slot = json['slot'] != null ? new Slot.fromJson(json['slot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slot != null) {
      data['slot'] = this.slot!.toJson();
    }
    return data;
  }
}

class Slot {
  MainSubmitBtnSlot? mainSubmitBtn;
  MainSubmitBtnSlot? contentDivBtn;
  MainSubmitBtnSlot? passDivBtn;
  MainSubmitBtnSlot? subDivBtn;
  MainSubmitBtnSlot? timerDiv;
  MainSubmitBtnSlot? radioBtnOne;
  MainSubmitBtnSlot? radioBtnTwo;
  MainSubmitBtnSlot? radioBtnThree;

  Slot(
      {this.mainSubmitBtn,
      this.contentDivBtn,
      this.passDivBtn,
      this.subDivBtn,
      this.timerDiv,
      this.radioBtnOne,
      this.radioBtnTwo,
      this.radioBtnThree});

  Slot.fromJson(Map<String, dynamic> json) {
    mainSubmitBtn = json['mainSubmitBtn'] != null
        ? new MainSubmitBtnSlot.fromJson(json['mainSubmitBtn'])
        : null;
    contentDivBtn = json['contentDivBtn'] != null
        ? new MainSubmitBtnSlot.fromJson(json['contentDivBtn'])
        : null;
    passDivBtn = json['passDivBtn'] != null
        ? new MainSubmitBtnSlot.fromJson(json['passDivBtn'])
        : null;
    subDivBtn = json['subDivBtn'] != null
        ? new MainSubmitBtnSlot.fromJson(json['subDivBtn'])
        : null;
    timerDiv = json['timerDiv'] != null
        ? new MainSubmitBtnSlot.fromJson(json['timerDiv'])
        : null;
    radioBtnOne = json['RadioBtnOne'] != null
        ? new MainSubmitBtnSlot.fromJson(json['RadioBtnOne'])
        : null;
    radioBtnTwo = json['RadioBtnTwo'] != null
        ? new MainSubmitBtnSlot.fromJson(json['RadioBtnTwo'])
        : null;
    radioBtnThree = json['RadioBtnThree'] != null
        ? new MainSubmitBtnSlot.fromJson(json['RadioBtnThree'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainSubmitBtn != null) {
      data['mainSubmitBtn'] = this.mainSubmitBtn!.toJson();
    }
    if (this.contentDivBtn != null) {
      data['contentDivBtn'] = this.contentDivBtn!.toJson();
    }
    if (this.passDivBtn != null) {
      data['passDivBtn'] = this.passDivBtn!.toJson();
    }
    if (this.subDivBtn != null) {
      data['subDivBtn'] = this.subDivBtn!.toJson();
    }
    if (this.timerDiv != null) {
      data['timerDiv'] = this.timerDiv!.toJson();
    }
    if (this.radioBtnOne != null) {
      data['RadioBtnOne'] = this.radioBtnOne!.toJson();
    }
    if (this.radioBtnTwo != null) {
      data['RadioBtnTwo'] = this.radioBtnTwo!.toJson();
    }
    if (this.radioBtnThree != null) {
      data['RadioBtnThree'] = this.radioBtnThree!.toJson();
    }
    return data;
  }
}

class MainSubmitBtnSlot {
  String? value;
  String? url;

  MainSubmitBtnSlot({this.value, this.url});

  MainSubmitBtnSlot.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['url'] = this.url;
    return data;
  }
}

class StyleForBtn {
  MainSubmitBtn? mainSubmitBtn;
  MainSubmitBtn? timerDiv;
  MainSubmitBtn? showRecommended;
  MainSubmitBtn? contentDivBtn;
  MainSubmitBtn? passDivBtn;
  MainSubmitBtn? subDivBtn;
  MainSubmitBtn? contentHeader;
  MainSubmitBtn? passHeader;
  MainSubmitBtn? subscriptionHeader;

  StyleForBtn(
      {this.mainSubmitBtn,
      this.timerDiv,
      this.showRecommended,
      this.contentDivBtn,
      this.passDivBtn,
      this.subDivBtn,
      this.contentHeader,
      this.passHeader,
      this.subscriptionHeader});

  StyleForBtn.fromJson(Map<String, dynamic> json) {
    mainSubmitBtn = json['mainSubmitBtn'] != null
        ? new MainSubmitBtn.fromJson(json['mainSubmitBtn'])
        : null;
    timerDiv = json['timerDiv'] != null
        ? new MainSubmitBtn.fromJson(json['timerDiv'])
        : null;
    showRecommended = json['showRecommended'] != null
        ? new MainSubmitBtn.fromJson(json['showRecommended'])
        : null;
    contentDivBtn = json['contentDivBtn'] != null
        ? new MainSubmitBtn.fromJson(json['contentDivBtn'])
        : null;
    passDivBtn = json['passDivBtn'] != null
        ? new MainSubmitBtn.fromJson(json['passDivBtn'])
        : null;
    subDivBtn = json['subDivBtn'] != null
        ? new MainSubmitBtn.fromJson(json['subDivBtn'])
        : null;
    contentHeader = json['contentHeader'] != null
        ? new MainSubmitBtn.fromJson(json['contentHeader'])
        : null;
    passHeader = json['passHeader'] != null
        ? new MainSubmitBtn.fromJson(json['passHeader'])
        : null;
    subscriptionHeader = json['subscriptionHeader'] != null
        ? new MainSubmitBtn.fromJson(json['subscriptionHeader'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainSubmitBtn != null) {
      data['mainSubmitBtn'] = this.mainSubmitBtn!.toJson();
    }
    if (this.timerDiv != null) {
      data['timerDiv'] = this.timerDiv!.toJson();
    }
    if (this.showRecommended != null) {
      data['showRecommended'] = this.showRecommended!.toJson();
    }
    if (this.contentDivBtn != null) {
      data['contentDivBtn'] = this.contentDivBtn!.toJson();
    }
    if (this.passDivBtn != null) {
      data['passDivBtn'] = this.passDivBtn!.toJson();
    }
    if (this.subDivBtn != null) {
      data['subDivBtn'] = this.subDivBtn!.toJson();
    }
    if (this.contentHeader != null) {
      data['contentHeader'] = this.contentHeader!.toJson();
    }
    if (this.passHeader != null) {
      data['passHeader'] = this.passHeader!.toJson();
    }
    if (this.subscriptionHeader != null) {
      data['subscriptionHeader'] = this.subscriptionHeader!.toJson();
    }
    return data;
  }
}

class MainSubmitBtn {
  String? border;
  String? borderRadius;
  String? backgroundColor;
  String? textAlign;
  String? text;
  String? fontFamily;
  String? fontWeight;
  String? color;
  String? textDecoration;
  String? textTransform;

  MainSubmitBtn(
      {this.border,
      this.borderRadius,
      this.backgroundColor,
      this.textAlign,
      this.text,
      this.fontFamily,
      this.fontWeight,
      this.color,
      this.textDecoration,
      this.textTransform});

  MainSubmitBtn.fromJson(Map<String, dynamic> json) {
    border = json['border'];
    borderRadius = json['borderRadius'];
    backgroundColor = json['backgroundColor'];
    textAlign = json['textAlign'];
    text = json['text'];
    fontFamily = json['fontFamily'];
    fontWeight = json['fontWeight'];
    color = json['color'];
    textDecoration = json['textDecoration'];
    textTransform = json['textTransform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['border'] = this.border;
    data['borderRadius'] = this.borderRadius;
    data['backgroundColor'] = this.backgroundColor;
    data['textAlign'] = this.textAlign;
    data['text'] = this.text;
    data['fontFamily'] = this.fontFamily;
    data['fontWeight'] = this.fontWeight;
    data['color'] = this.color;
    data['textDecoration'] = this.textDecoration;
    data['textTransform'] = this.textTransform;
    return data;
  }
}

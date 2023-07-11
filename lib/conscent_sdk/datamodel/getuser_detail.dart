class GetUserDetail {
  Address? address;
  Wallet? wallet;
  String? name;
  String? sId;
  String? phoneNumber;
  String? country;
  bool? promotionalOptIn;
  String? lastPurchasedOn;
  String? hashedPhoneNumber;
  bool? previousSubscriber;
  bool? existingSubscriber;

  GetUserDetail(
      {this.address,
      this.wallet,
      this.name,
      this.sId,
      this.phoneNumber,
      this.country,
      this.promotionalOptIn,
      this.lastPurchasedOn,
      this.hashedPhoneNumber,
      this.previousSubscriber,
      this.existingSubscriber});

  GetUserDetail.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    name = json['name'];
    sId = json['_id'];
    phoneNumber = json['phoneNumber'];
    country = json['country'];
    promotionalOptIn = json['promotionalOptIn'];
    lastPurchasedOn = json['lastPurchasedOn'];
    hashedPhoneNumber = json['hashedPhoneNumber'];
    previousSubscriber = json['previousSubscriber'];
    existingSubscriber = json['existingSubscriber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    data['name'] = this.name;
    data['_id'] = this.sId;
    data['phoneNumber'] = this.phoneNumber;
    data['country'] = this.country;
    data['promotionalOptIn'] = this.promotionalOptIn;
    data['lastPurchasedOn'] = this.lastPurchasedOn;
    data['hashedPhoneNumber'] = this.hashedPhoneNumber;
    data['previousSubscriber'] = this.previousSubscriber;
    data['existingSubscriber'] = this.existingSubscriber;
    return data;
  }
}

class Address {
  String? apartment;
  String? area;
  String? pincode;
  String? landmark;
  String? city;
  String? state;
  String? country;

  Address(
      {this.apartment,
      this.area,
      this.pincode,
      this.landmark,
      this.city,
      this.state,
      this.country});

  Address.fromJson(Map<String, dynamic> json) {
    apartment = json['apartment'];
    area = json['area'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apartment'] = this.apartment;
    data['area'] = this.area;
    data['pincode'] = this.pincode;
    data['landmark'] = this.landmark;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}

class Wallet {
  Balance? balance;
  String? currency;

  Wallet({this.balance, this.currency});

  Wallet.fromJson(Map<String, dynamic> json) {
    balance =
        json['balance'] != null ? new Balance.fromJson(json['balance']) : null;
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.balance != null) {
      data['balance'] = this.balance!.toJson();
    }
    data['currency'] = this.currency;
    return data;
  }
}

class Balance {
  String? numberDecimal;

  Balance({this.numberDecimal});

  Balance.fromJson(Map<String, dynamic> json) {
    numberDecimal = json['$numberDecimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberDecimal'] = this.numberDecimal;
    return data;
  }
}

class GenrateTokenPost {
  String? phoneNumber;
  String? email;

  GenrateTokenPost({this.phoneNumber, this.email});

  GenrateTokenPost.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    return data;
  }
}

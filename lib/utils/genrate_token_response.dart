class GenrateTokenResponse {
  String? tempAuthToken;

  GenrateTokenResponse({this.tempAuthToken});

  GenrateTokenResponse.fromJson(Map<String, dynamic> json) {
    tempAuthToken = json['tempAuthToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tempAuthToken'] = tempAuthToken;
    return data;
  }
}

class Ping {
  List<PingMessageBody>? messageBody;

  Ping({this.messageBody});

  Ping.fromJson(Map<String, dynamic> json) {
    if (json['messageBody'] != null) {
      messageBody = <PingMessageBody>[];
      json['messageBody'].forEach((v) {
        messageBody!.add(PingMessageBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (messageBody != null) {
      data['messageBody'] = messageBody!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PingMessageBody {
  String? pingId;
  String? clientId;
  bool? active;
  int? counter;
  String? anonId;
  String? userId;
  String? contentId;
  String? authorName;
  String? contentTitle;
  List<String>? contentTags;
  List<String>? contentSections;
  List<String>? contentCategories;

  PingMessageBody({
    this.pingId,
    this.clientId,
    this.active,
    this.counter,
    this.anonId,
    this.userId,
    this.contentId,
    this.authorName,
    this.contentTitle,
    this.contentTags,
    this.contentSections,
    this.contentCategories,
  });

  PingMessageBody.fromJson(Map<String, dynamic> json) {
    pingId = json['pingId'];
    clientId = json['clientId'];
    active = json['active'];
    counter = json['counter'];
    anonId = json['anonId'];
    userId = json['userId'];
    contentId = json['contentId'];
    authorName = json['authorName'];
    contentTitle = json['contentTitle'];
    contentTags = json['contentTags'].cast<String>();
    contentSections = json['contentSections'].cast<String>();
    contentCategories = json['contentCategories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pingId'] = pingId;
    data['clientId'] = clientId;
    data['active'] = active;
    data['counter'] = counter;
    data['anonId'] = anonId;
    data['userId'] = userId;
    data['contentId'] = contentId;
    data['authorName'] = authorName;
    data['contentTitle'] = contentTitle;
    data['contentTags'] = contentTags;
    data['contentSections'] = contentSections;
    data['contentCategories'] = contentCategories;
    return data;
  }
}

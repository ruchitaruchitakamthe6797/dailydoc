class SendMessageResponse {
  bool? error;
  Data? data;

  SendMessageResponse({this.error, this.data});

  SendMessageResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? text;
  String? conversation;
  String? sender;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.text,
      this.conversation,
      this.sender,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    conversation = json['conversation'];
    sender = json['sender'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['conversation'] = this.conversation;
    data['sender'] = this.sender;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

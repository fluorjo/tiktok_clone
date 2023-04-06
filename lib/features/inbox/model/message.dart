class MessageModel {
  final String text;
  final String userId;

  MessageModel({
    required this.text,
    required this.userId,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        userId = json['user'];

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "userId": userId,
    };
  }
}

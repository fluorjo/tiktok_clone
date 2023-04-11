class MessageModel {
  final String text;
  final String userId;
  final int createdAt;

  MessageModel({
    required this.createdAt,
    required this.text,
    required this.userId,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        createdAt = json['createdAt'],
        userId = json['user'];

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "userId": userId,
      "createdAt": createdAt,
    };
  }
}

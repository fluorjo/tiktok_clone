class VideoModel {
  final String id;
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final String creatorUid;
  final String creator;
  final int likes;
  final int comments;
  final int createdAt;

  VideoModel({
    required this.id,
    required this.description,
    required this.fileUrl,
    required this.thumbnailUrl,
    required this.creatorUid,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.title,
    required this.creator,
  });

  VideoModel.fromJson({
    required Map<String, dynamic> json,
    required String videoId,
  })  : description = json['description'],
        fileUrl = json['fileUrl'],
        thumbnailUrl = json['thumbnailUrl'],
        creatorUid = json['creatorUid'],
        likes = json['likes'],
        comments = json['comments'],
        createdAt = json['createdAt'],
        title = json['title'],
        creator = json['creator'],
        id = videoId;

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'fileUrl': fileUrl,
      'thumbnailUrl': thumbnailUrl,
      'creatorUid': creatorUid,
      'likes': likes,
      'comments': comments,
      'createdAt': createdAt,
      'title': title,
      'creator': creator,
      'id': id,
    };
  }
}

class UserProfileModel {
  final String email;
  final String username;
  final String uid;
  final String bio;
  final String link;

  UserProfileModel({
    required this.email,
    required this.username,
    required this.uid,
    required this.bio,
    required this.link,
  });

  UserProfileModel.empty()
      : uid = '',
        email = '',
        username = '',
        bio = '',
        link = '';

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        email = json['email'],
        username = json['username'],
        bio = json['bio'],
        link = json['link'];
  Map<String, String> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': username,
      'bio': bio,
      'link': link,
    };
  }
}

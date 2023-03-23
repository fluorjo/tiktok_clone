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

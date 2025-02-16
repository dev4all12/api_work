class UserPicture {
  final String large;
  final String medium;
  final String thumbnail;
  UserPicture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory UserPicture.fromMap(Map<String, dynamic> e) {
    return UserPicture(
      large: e['picture']['large'],
      medium: e['picture']['medium'],
      thumbnail: e['picture']['thumbnail'],
    );
  }
}

class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });
  factory UserLocation.fromMap(Map<String, dynamic> json) {
    return UserLocation(
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postcode: json['postcode']);
  }
}

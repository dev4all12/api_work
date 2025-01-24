import 'package:api_work/model/user_dob.dart';
import 'package:api_work/model/user_location.dart';
import 'package:api_work/model/user_name.dart';
import 'package:api_work/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
      title: e['name']['title'],
      first: e['name']['first'],
      last: e['name']['last'],
    );
    final date = e['dob']['date'];
    final dob = UserDob(age: e['dob']['age'], date: DateTime.parse(date));
    final picture = UserPicture.fromMap(e['picture']);
    final location = UserLocation.fromMap(e['location']);
    return User(
      gender: e['gender'],
      cell: e['cell'],
      email: e['email'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }
  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}

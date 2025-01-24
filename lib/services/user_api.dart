import 'package:api_work/model/user_dob.dart';
import 'package:api_work/model/user_location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_work/model/user.dart';
import 'package:api_work/model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('Api data');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;

    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final date = e['dob']['date'];
      final dob = UserDob(age: e['dob']['age'], date: DateTime.parse(date));
      final location = UserLocation(
          city: e['location']['city'],
          state: e['location']['state'],
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString());
      return User(
        gender: e['gender'],
        cell: e['cell'],
        email: e['email'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();

    return users;
    // print('userDetail fetched');
  }
}

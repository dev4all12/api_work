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
      return User(
        gender: e['gender'],
        cell: e['cell'],
        email: e['email'],
        phone: e['phone'],
        name: name,
      );
    }).toList();

    return users;
    // print('userDetail fetched');
  }
}

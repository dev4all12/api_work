import 'dart:convert';
import 'dart:math';

import 'package:api_work/user/user.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Call'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // final name = user['name']['first'];
            final email = user.gender;
            final genderColor =
                user.gender == 'male' ? Colors.blue[300] : Colors.pink[100];
            // final imgUrl = user['picture']['thumbnail'];

            return ListTile(
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.network(imgUrl),
              // ),

              title: Text(user.name.first),
              subtitle: Text(user.phone),
              // tileColor: genderColor,
              // subtitle: Text(email),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async {
    print('Api data');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;

    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
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
    setState(() {
      users = transformed;
    });
    // print('userDetail fetched');
  }
}

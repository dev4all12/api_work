import 'package:flutter/material.dart';
import 'package:api_work/model/user.dart';
import 'package:api_work/services/user_api.dart';
// import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

//calling fetched user data when load
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

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
            // final email = user.gender;
            // final genderColor =
            //     user.gender == 'male' ? Colors.blue[300] : Colors.pink[100];
            // final imgUrl = user['picture']['thumbnail'];

            return ListTile(
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.network(imgUrl),
              // ),

              title: Text(user.fullName),
              // subtitle: Text(user.location.postcode),
              // tileColor: genderColor,
              // subtitle: Text(email),
            );
          }),
    );
  }

  void fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}

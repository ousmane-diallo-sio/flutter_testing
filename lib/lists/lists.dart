import 'package:flutter/material.dart';
import 'package:flutter_testing/lists/user.dart';
import 'package:flutter_testing/lists/user_item.dart';

void main() {
  runApp(const ListApp());
}

class ListApp extends StatelessWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: ListHome()),
    );
  }
}

class ListHome extends StatelessWidget {
  ListHome({Key? key}) : super(key: key);

  final List<User> _users = List.generate(100, (index) {
    return User(
        firstName: "Ousmane${index}",
        lastName: "Diallo${index}",
        address: "121 rue Saint Antoine${index}");
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            color: Colors.green,
            height: 150,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: UserItem(
                user: _users[index],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: UserItem(
              user: _users[index],
            ),
          );
        }
      },
    ));
  }
}

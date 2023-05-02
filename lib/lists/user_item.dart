import 'package:flutter/material.dart';
import 'package:flutter_testing/lists/user.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.blueAccent,
      child: Center(
        child: Column(
          children: [
            Text(
              "${user.firstName} ${user.lastName}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              user.address,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}

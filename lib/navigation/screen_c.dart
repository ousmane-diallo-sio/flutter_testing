import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  static const String routeName = '/screenC';

  static void navigateTo(BuildContext context, int id) {
    Navigator.of(context).pushNamed(routeName, arguments: id);
  }

  final int id;

  const ScreenC({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen C"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$id'),
            ElevatedButton(
              child: Text("Go back"),
              onPressed: () => _goBack(context),
            ),
          ],
        ),
      ),
    );
  }

  void _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}

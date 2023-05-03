import 'package:flutter/material.dart';
import 'package:flutter_testing/webservices/webservices.dart';

void main() {
  runApp(const WebServiceApp());
}

class WebServiceApp extends StatelessWidget {
  const WebServiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(child: WebServiceHome()),
    );
  }
}

class WebServiceHome extends StatelessWidget {
  const WebServiceHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requête HTTP en Dart"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            WebServices.getAllUsers();
          },
          child: Text("Lancer la requête"),
        ),
      ),
    );
  }
}

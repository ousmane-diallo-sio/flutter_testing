import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text("Oui test"),),
    );
  }
}


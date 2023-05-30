import 'package:flutter/material.dart';
import 'package:flutter_testing/configuration_widget.dart';
import 'package:flutter_testing/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfigurationWidget(
      configuration: Configuration(
        baseUrl: 'https://jsonplaceholder.typicode.com',
      ),
      child: MaterialApp(
        title: 'Flutter Testing title',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SafeArea(child: Home()),
      ),
    );
  }
}

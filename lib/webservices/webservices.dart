import 'package:flutter/material.dart';
import 'package:flutter_testing/webservices/user_web_service.dart';
import 'package:http/http.dart' as http;

class WebServices {

  static Future<List<UserWebService>> getAllUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    switch (response.statusCode) {
      case 200:
        debugPrint("response body : ${response.body}");
        return [];
      default:
        throw Exception('Failed to load users');
    }
  }

}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testing/webservices/user_web_service.dart';
import 'package:http/http.dart' as http;

class WebServices {

  static Future<List<UserWebService>> getAllUsers() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      switch (response.statusCode) {
        case 200:
          final List<dynamic> usersJson = json.decode(response.body) as List<dynamic>;
          return usersJson.map((userJson) {
            return UserWebService.fromJson(userJson as Map<String, dynamic>);
          }).toList();
        default:
          throw Exception('Failed to load users');
      }
    } catch (error) {
      debugPrint('Error while getting all users');
      rethrow;
    }
  }

}
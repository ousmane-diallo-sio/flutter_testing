import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_testing/webservices/user_web_service.dart';
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

class WebServiceHome extends StatefulWidget {
  const WebServiceHome({Key? key}) : super(key: key);

  @override
  State<WebServiceHome> createState() => _WebServiceHomeState();
}

class _WebServiceHomeState extends State<WebServiceHome> {
  bool _isLoading = false;
  final List<UserWebService> _users = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _getAllUsers();
  }

  void _getAllUsers() async {
    try {
      final users = await WebServices.getAllUsers();
      setState(() {
        _isLoading = false;
        _users.clear();
        _users.addAll(users);
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Une erreur est survenue';
      });
    }
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_error != null) {
      return Center(
        child: Text(_error ?? ''),
      );
    }
    if (_users.isEmpty) {
      return const Center(
        child: Text("Aucun utilisateur"),
      );
    }

    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) {
        final user = _users[index];
        return ListTile(
          title: Text('${user.name}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requête HTTP en Dart"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _getAllUsers,
            child: Text("Lancer la requête"),
          ),
          Expanded(child: _buildBody(context))
        ],
      ),
    );
  }
}

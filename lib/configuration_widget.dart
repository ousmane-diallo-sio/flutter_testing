import 'package:flutter/material.dart';

class Configuration {
  final String baseUrl;
  Configuration({ required this.baseUrl });
}

class ConfigurationWidget extends InheritedWidget {
  const ConfigurationWidget({
    Key? key,
    required Widget child,
    required this.configuration
  }) : super(key: key, child: child);

  final Configuration configuration;

  static ConfigurationWidget of(BuildContext context) {
    final ConfigurationWidget? result =
        context.dependOnInheritedWidgetOfExactType<ConfigurationWidget>();
    assert(result != null, 'No ConfigurationWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ConfigurationWidget old) {
    return true;
  }
}

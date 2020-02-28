import 'dart:convert';

import 'package:flutter/services.dart';

import 'environment.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config;

  static Future<void> initialize(String env) async {
    String configString;
    switch (env) {
      case Environment.dev:
        configString =
            await rootBundle.loadString('config/app_config_dev.json');
        _config = json.decode(configString) as Map<String, dynamic>;
        break;
      case Environment.prod:
        configString =
            await rootBundle.loadString('config/app_config_prod.json');
        _config = json.decode(configString) as Map<String, dynamic>;
        break;
    }
  }

  static int getIncrementAmount() {
    return _config['incrementAmount'] as int;
  }

  static String getSecretKey() {
    return _config['secretKey'] as String;
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Dev';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _currentEnv = data['currentEnv'];
      _edamamApiKey = data['edamamApiKey'];
      _edamamAppId = data['edamamAppId'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _currentEnv = '';
  String get currentEnv => _currentEnv;

  String _edamamApiKey = '';
  String get edamamApiKey => _edamamApiKey;

  String _edamamAppId = '';
  String get edamamAppId => _edamamAppId;
}

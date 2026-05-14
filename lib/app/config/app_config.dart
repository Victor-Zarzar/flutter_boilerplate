import 'package:flutter_boilerplate/app/shared/constants/constants.dart';
import 'package:http/http.dart' as http;

class AppConfig {
  AppConfig._();
  static late final http.Client httpClient;

  static String get baseUrl => _getBaseUrl();

  static Future<void> init() async {
    httpClient = http.Client();
  }

  static String _getBaseUrl() {
    return Constants.apiBaseUrl;
  }

  static String getSentryDsn() {
    return Constants.sentryDsn;
  }

  static String getSentryEnv() {
    return Constants.sentryEnv;
  }
}

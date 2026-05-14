import 'dart:convert';
import 'package:flutter_boilerplate/app/config/app_config.dart';
import 'package:flutter_boilerplate/app/shared/utils/logger.dart';
import 'package:flutter_boilerplate/app/shared/utils/task_runner.dart';
import 'package:flutter_boilerplate/app/shared/utils/typdefs.dart';
import 'package:http/http.dart' as http;

class HttpService {
  HttpService._();
  static final HttpService instance = HttpService._();

  FutureEither<http.Response> get(String path, {Map<String, String>? headers}) {
    return runTask(() async {
      final response = await AppConfig.httpClient.get(
        Uri.parse('${AppConfig.baseUrl}$path'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          ...?headers,
        },
      );
      _logResponse(response);
      return response;
    }, requiresNetwork: true);
  }

  FutureEither<http.Response> post(
    String path, {
    dynamic body,
    Map<String, String>? headers,
  }) {
    return runTask(() async {
      final response = await AppConfig.httpClient.post(
        Uri.parse('${AppConfig.baseUrl}$path'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          ...?headers,
        },
        body: jsonEncode(body),
      );
      _logResponse(response);
      return response;
    }, requiresNetwork: true);
  }

  FutureEither<http.Response> put(
    String path, {
    dynamic body,
    Map<String, String>? headers,
  }) {
    return runTask(() async {
      final response = await AppConfig.httpClient.put(
        Uri.parse('${AppConfig.baseUrl}$path'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          ...?headers,
        },
        body: jsonEncode(body),
      );
      _logResponse(response);
      return response;
    }, requiresNetwork: true);
  }

  FutureEither<http.Response> delete(
    String path, {
    Map<String, String>? headers,
  }) {
    return runTask(() async {
      final response = await AppConfig.httpClient.delete(
        Uri.parse('${AppConfig.baseUrl}$path'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          ...?headers,
        },
      );
      _logResponse(response);
      return response;
    }, requiresNetwork: true);
  }

  void _logResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      AppLogger.debug(
        '[HTTP] RESPONSE[${response.statusCode}] => ${response.request?.url}',
      );
    } else {
      AppLogger.error(
        '[HTTP] RESPONSE[${response.statusCode}] => ${response.request?.url}',
      );
    }
  }
}

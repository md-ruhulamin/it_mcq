import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:it_mcq/utility/widgets/widgets.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
enum Environment { dev, stage, prod }

class HttpHelper {
  static const String _devBaseUrl = 'https://family/wp-json/vogo/v1';
  static const String _stageBaseUrl = 'https://.example.com';
  static const String _prodBaseUrl = 'https://.example.com';

  static Environment env = Environment.dev;

  static String get _defaultBaseUrl {
    switch (env) {
      case Environment.stage:
        return _stageBaseUrl;
      case Environment.prod:
        return _prodBaseUrl;
      case Environment.dev:
        return _devBaseUrl;
    }
  }

  final String imageUrl = "$_devBaseUrl/public";
  final String baseUrl;

  HttpHelper({String? baseUrl}) : baseUrl = baseUrl ?? _defaultBaseUrl;

  Future<Map<String, String>> _buildHeaders({bool isJson = true}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final headers = <String, String>{};
    if (isJson) headers['Content-Type'] = 'application/json';
    if (token != null) headers['Authorization'] = 'Bearer $token';

    return headers;
  }

  /// GET Request: Fetches data from the specified endpoint.
  Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final headers = await _buildHeaders();

      final response = await http
          .get(url, headers: headers)
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// POST Request: Sends data to the specified endpoint in JSON format.
  Future<http.Response> postData(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final headers = await _buildHeaders();

      http.Response response = await http
          .post(url, headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException {
      showCustomToasts(msg: "No Internet connection");
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Could not find the requested resource');
    } on FormatException {
      throw Exception('Bad response format');
    } on TimeoutException {
      throw Exception('Request timed out');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// POST Request: Sends data to the specified endpoint in JSON format.
  Future<http.Response> putData(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final headers = await _buildHeaders();

      http.Response response = await http
          .put(url, headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException {
      showCustomToasts(msg: "No Internet connection");
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Could not find the requested resource');
    } on FormatException {
      throw Exception('Bad response format');
    } on TimeoutException {
      throw Exception('Request timed out');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// POST Multipart Request for File Upload
  /// - `fields` is used for any additional form fields to be sent along with the file.
  Future<dynamic> postMultipartData(
    String endpoint,
    File file,
    Map<String, String> fields,
  ) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final headers = await _buildHeaders(isJson: false);

      final request = http.MultipartRequest('POST', url)
        ..fields.addAll(fields)
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      request.headers.addAll(headers);

      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 15),
      );
      final response = await http.Response.fromStream(streamedResponse);
      return _handleResponse(response);
    } on SocketException {
      showCustomToasts(msg: "No Internet connection");
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// PATCH Request: Updates partial data to the specified endpoint in JSON format.
  Future<http.Response> patchData(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final headers = await _buildHeaders();

      http.Response response = await http
          .patch(url, headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException {
      showCustomToasts(msg: "No Internet connection");
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Could not find the requested resource');
    } on FormatException {
      throw Exception('Bad response format');
    } on TimeoutException {
      throw Exception('Request timed out');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Helper Method to Handle HTTP Responses
  /// - Parses the JSON if successful or throws an error for specific status codes.
  dynamic _handleResponse(http.Response response) {
    print(response.body);
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response; // Parse JSON on success
      case 400:
        return response;
      case 401:
        // final context = navigatorKey.currentContext;
        //
        // if (context != null) {
        //   context.read<AuthenticationProvider>().logout();
        //
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (_) => SignInScreen()),
        //     // Replace with your login screen widget
        //     (route) => false,
        //   );
        //   showCustomToast("Logged Out");
        // }
      case 403:
        return response;
        throw Exception('Unauthorized access');
      case 404:
        throw Exception('Resource not found');
      case 500:
        return response;
      default:
        throw Exception(
          'Server error: ${response.statusCode}, ${response.reasonPhrase}',
        );
    }
  }
}

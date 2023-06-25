import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/Auth/entity/error_container.dart';
import 'package:flutter_learning/shared/services/internet_connection.dart';
import 'package:flutter_learning/shared/services/navigation_service.dart';
import 'package:flutter_learning/shared/services/show_error_widget.dart';
import 'package:http/http.dart' as http;

class RequestClient {
  factory RequestClient() {
    _instance ??= RequestClient._internal();
    return _instance!;
  }

  RequestClient._internal() {
    _client = http.Client();
  }

  static const String userAgent = 'User-Agent';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';

  static RequestClient? _instance;
  late http.Client _client;

  Future<Map<String, String>> _createCommonHeader() async {
    final common = <String, String>{};
    common[accept] = ContentType.json.toString();
    return common;
  }

  Future<Map<String, String>> _createHeader() async {
    final common = <String, String>{};
    common[contentType] = ContentType.json.toString();
    return common;
  }

  Future<http.Response> get(String url, Map<String, String> headers) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('-------------------------------');
    debugPrint('GET Request');
    debugPrint(url);
    debugPrint(headers.toString());
    debugPrint('-------------------------------');
    headers.addAll(await _createCommonHeader());
    if (isInternet) {
      final response = await _client.get(Uri.parse(url), headers: headers);
      if (!url.contains('Country/GetCountryList') && !url.contains('Logout')) {
        apiHandleFunction(response);
      }
      return response;
    } else {
      showErrorMessage("No Intenet Connection",
          NavigationService.navigatorKey.currentContext!);
      // showErrorMessage("No Internet Connection",
      //     NavigationService.navigatorKey.currentContext!);
      return http.Response('No Internet Connection', 503);
    }
  }

  Future<http.Response> post(
      String url, Map<String, String> headers, String? body) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('-------------------------------');
    debugPrint('POST Request');
    debugPrint(url);
    debugPrint(headers.toString());
    debugPrint('-------------------------------');
    headers.addAll(await _createCommonHeader());
    if (isInternet) {
      final response = await _client.post(Uri.parse(url),
          headers: headers, body: body, encoding: Encoding.getByName('utf-8'));
      if (!url.contains('Country/GetCountryList') && !url.contains('Logout')) {
        apiHandleFunction(response);
      }

      return response;
    } else {
      showErrorMessage("No Intenet Connection",
          NavigationService.navigatorKey.currentContext!);
      return http.Response('No Internet Connection', 503);
    }
  }

  Future<http.Response> patch(
      String url, Map<String, String> headers, String? body) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('-------------------------------');
    debugPrint('patch Request');
    debugPrint(url);
    debugPrint(headers.toString());
    debugPrint('-------------------------------');
    headers.addAll(await _createCommonHeader());
    if (isInternet) {
      final response = await _client.patch(Uri.parse(url),
          headers: headers, body: body, encoding: Encoding.getByName('utf-8'));

      apiHandleFunction(response);

      return response;
    } else {
      showErrorMessage("No Intenet Connection",
          NavigationService.navigatorKey.currentContext!);
      return http.Response('No Internet Connection', 503);
    }
  }

  Future<http.Response> postJson(
      String url, Map<String, String> headers, String body) async {
    headers
      ..addAll(await _createCommonHeader())
      ..addAll(await _createHeader());

    final response = await _client.post(Uri.parse(url),
        headers: headers, body: body, encoding: Encoding.getByName('utf-8'));
    return response;
  }

  Future<http.Response> put(
      String url, Map<String, String> headers, String? body) async {
    var isInternet = await CheckInternetConnection().isInternet();
    headers.addAll(await _createCommonHeader());
    if (isInternet) {
      final response = await _client.put(Uri.parse(url),
          headers: headers, body: body, encoding: Encoding.getByName('utf-8'));
      if (!url.contains('Country/GetCountryList') && !url.contains('Logout')) {
        apiHandleFunction(response);
      }
      return response;
    } else {
      showErrorMessage("No Intenet Connection",
          NavigationService.navigatorKey.currentContext!);
      return http.Response('No Internet Connection', 503);
    }
  }

  Future<http.StreamedResponse> upload(http.MultipartRequest request) async {
    final response = await _client.send(request);
    return response;
  }

  Future<http.Response> delete(
      String url, Map<String, String> headers, String body) async {
    var isInternet = await CheckInternetConnection().isInternet();
    headers.addAll(await _createCommonHeader());
    if (isInternet) {
      final response =
          await _client.delete(Uri.parse(url), headers: headers, body: body);
      apiHandleFunction(response);
      return response;
    } else {
      showErrorMessage("No Intenet Connection",
          NavigationService.navigatorKey.currentContext!);
      return http.Response('No Internet Connection', 503);
    }
  }
}

apiHandleFunction(response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    return null;
  } else if (response.statusCode == 401) {
    showErrorMessage(
        "Please login again.", NavigationService.navigatorKey.currentContext!,
        type: "auth");
  } else if (response.statusCode == 500) {
    final dynamic object = json.decode(response.body);
    final code = ErrorContainer.fromJson(object as Map<String, dynamic>);

    showErrorMessage(code.errorList![0].message,
        NavigationService.navigatorKey.currentContext!);
  } else if (response.statusCode == 503) {
  } else if (response.statusCode == 400) {
    if (response.body != "Success") {
      final dynamic object = json.decode(response.body);
      final code = ErrorContainer.fromJson(object as Map<String, dynamic>);

      showErrorMessage(code.errorList![0].message,
          NavigationService.navigatorKey.currentContext!);
    }
  } else if (response.statusCode == 404) {
    showErrorMessage(
        "Please login again.", NavigationService.navigatorKey.currentContext!,
        type: "auth");
  } else {
    final dynamic object = json.decode(response.body);
    final code = ErrorContainer.fromJson(object as Map<String, dynamic>);

    showErrorMessage(code.errorList![0].message,
        NavigationService.navigatorKey.currentContext!);
  }
}

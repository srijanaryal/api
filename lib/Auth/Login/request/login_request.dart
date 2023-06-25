import 'dart:convert';

import 'package:flutter_learning/Auth/Login/entity/login.dart';
import 'package:flutter_learning/api/request.dart';
import 'package:flutter_learning/api/request_client.dart';
import 'package:flutter_learning/api/response.dart';
import 'package:flutter_learning/shared/constants/api_constants.dart';

class LoginRequest implements Request {
  static const _endPoint = APIConstants.loginApi;

  LoginRequest({this.loginModel});

  final String? loginModel;

  @override
  String? getBody() {
    return loginModel;
  }

  @override
  Map<String, String> getHeaders() {
    return Request.createHeader();
  }

  @override
  String getUrl() {
    return Request.createUrl(_endPoint);
  }

  Future<LoginResponse> execute() async {
    final result = LoginResponse();
    await RequestClient()
        .post(getUrl(), getHeaders(), getBody())
        .then((response) {
      print(getUrl());
      if (response.statusCode == 200 || response.statusCode == 204) {
        final dynamic object = json.decode(response.body);
        final user = Login.fromJson(object as Map<String, dynamic>);
        user.issuedTime = DateTime.now().millisecondsSinceEpoch;
        result
          ..hasError = false
          ..errorMessage = ''
          ..statusCode = response.statusCode
          ..response = user;
      }
    }).catchError((Object error) {
      result
        ..hasError = true
        ..errorMessage = Response.getErrorMessage(error);
    });
    return result;
  }
}

class LoginResponse extends Response {
  LoginResponse(
      {this.hasError = false,
      this.errorMessage = '',
      this.response,
      this.statusCode = 1});
  int? statusCode;

  bool hasError;
  String? errorMessage;
  Login? response;
}

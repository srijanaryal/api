import 'dart:convert';

import 'package:flutter_learning/Auth/Login/entity/login_model.dart';
import 'package:flutter_learning/Auth/Login/request/login_request.dart';

class AuthRepository {
  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal();

  static final AuthRepository _instance = AuthRepository._internal();

  Future<LoginResponse> login(LoginModel data) async {
    final jsonData = json.encode(data);
    final request = LoginRequest(loginModel: jsonData);
    final response = await request.execute();
    return response;
  }
}

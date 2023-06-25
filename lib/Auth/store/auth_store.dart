import 'dart:async';
import 'dart:convert';

import 'package:flutter_learning/Auth/Login/entity/login_model.dart';
import 'package:flutter_learning/Auth/Login/request/login_request.dart';
import 'package:flutter_learning/Auth/auth_repository.dart';
import 'package:flutter_learning/shared/constants/shared_prefs_constant.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Include generated file
part 'auth_store.g.dart';

// This is the class used by rest of your codebase
class AuthStore = _AuthStore with _$AuthStore;

// The store-class
abstract class _AuthStore with Store {
  //repository
  final _authRepository = AuthRepository();

  //observables

  @observable
  bool isLoginLoading = false;

  @observable
  bool isUserLoggedIn = false;

  //response data
  @observable
  LoginResponse? loginResponseData;

  @action
  Future<LoginResponse> login(LoginModel data) async {
    isLoginLoading = true;
    return await ObservableFuture(_authRepository.login(data))
        .then((value) async {
      isLoginLoading = false;

      loginResponseData = value;
      if (loginResponseData != null && !loginResponseData!.hasError) {
        //save auth response in shared preference
        _saveAuthDataInSharedPref(loginResponseData!, data);
      }
      return value;
    });
  }

  _saveAuthDataInSharedPref(dynamic data, LoginModel loginData) async {
    final pref = await SharedPreferences.getInstance();
    final userAuthData = json.encode({
      SharedConstants.token: data.response!.accessToken,
      SharedConstants.expiresIn: data.response!.expiresIn,
      SharedConstants.issuedTime: data.response!.issuedTime,
      SharedConstants.refreshToken: data.response!.refreshToken,
    });
    pref.setString(SharedConstants.userAuthData, userAuthData);
  }
}

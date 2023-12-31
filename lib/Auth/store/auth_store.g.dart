// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$isLoginLoadingAtom =
      Atom(name: '_AuthStore.isLoginLoading', context: context);

  @override
  bool get isLoginLoading {
    _$isLoginLoadingAtom.reportRead();
    return super.isLoginLoading;
  }

  @override
  set isLoginLoading(bool value) {
    _$isLoginLoadingAtom.reportWrite(value, super.isLoginLoading, () {
      super.isLoginLoading = value;
    });
  }

  late final _$isUserLoggedInAtom =
      Atom(name: '_AuthStore.isUserLoggedIn', context: context);

  @override
  bool get isUserLoggedIn {
    _$isUserLoggedInAtom.reportRead();
    return super.isUserLoggedIn;
  }

  @override
  set isUserLoggedIn(bool value) {
    _$isUserLoggedInAtom.reportWrite(value, super.isUserLoggedIn, () {
      super.isUserLoggedIn = value;
    });
  }

  late final _$loginResponseDataAtom =
      Atom(name: '_AuthStore.loginResponseData', context: context);

  @override
  LoginResponse? get loginResponseData {
    _$loginResponseDataAtom.reportRead();
    return super.loginResponseData;
  }

  @override
  set loginResponseData(LoginResponse? value) {
    _$loginResponseDataAtom.reportWrite(value, super.loginResponseData, () {
      super.loginResponseData = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStore.login', context: context);

  @override
  Future<LoginResponse> login(LoginModel data) {
    return _$loginAsyncAction.run(() => super.login(data));
  }

  @override
  String toString() {
    return '''
isLoginLoading: ${isLoginLoading},
isUserLoggedIn: ${isUserLoggedIn},
loginResponseData: ${loginResponseData}
    ''';
  }
}

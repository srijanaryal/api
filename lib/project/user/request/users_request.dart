import 'dart:convert';

import 'package:flutter_learning/project/user/entity/users_container.dart';

import '../../../Auth/entity/error_container.dart';
import '../../../api/request.dart';
import '../../../api/request_client.dart';
import '../../../api/response.dart';

class UsersRequest implements Request {
  static const _endPoint = 'https://jsonplaceholder.typicode.com/users';

  UsersRequest();

  @override
  String getBody() {
    return "";
  }

  @override
  Map<String, String> getHeaders() {
    return Request.createAuthHeader('');
  }

  @override
  String getUrl() {
    return _endPoint;
  }

  Future<UsersResponse> execute() async {
    final result = UsersResponse();
    await RequestClient().get(getUrl(), getHeaders()).then((response) {
      // print("Response status code: ${response.statusCode}");

      if (response.statusCode.toString()[0] == "2") {
        final List<dynamic> responseBody = json.decode(response.body);
        final List<UsersContainer> responseData =
            responseBody.map((data) => UsersContainer.fromJson(data)).toList();
        result
          ..hasError = false
          ..errorMessage = ''
          ..usersContainer = responseData
          ..statusCode = response.statusCode;
      } else if (response.statusCode == 503) {
        result
          ..hasError = true
          ..errorMessage = response.body;
      } else {
        final dynamic object = json.decode(response.body);
        final code = ErrorContainer.fromJson(object as Map<String, dynamic>);
        result
          ..hasError = true
          ..errorMessage = '';
      }
    }).catchError((Object error) {
      result
        ..hasError = true
        ..errorMessage = Response.getErrorMessage(error);
    });
    return result;
  }
}

class UsersResponse extends Response {
  UsersResponse({
    this.hasError = false,
    this.errorMessage = '',
    this.usersContainer,
  });

  bool hasError;
  String errorMessage;
  int? statusCode;

  List<UsersContainer>? usersContainer;
}

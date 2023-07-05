import 'dart:convert';

import 'package:flutter_learning/project/work/entity/work_container.dart';

import '../../../Auth/entity/error_container.dart';
import '../../../api/request.dart';
import '../../../api/request_client.dart';
import '../../../api/response.dart';

class WorkRequest implements Request {
  static const _endPoint = 'https://www.boredapi.com/api/activity';

  WorkRequest();

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

  Future<DogResponse> execute() async {
    final result = DogResponse();
    await RequestClient().get(getUrl(), getHeaders()).then((response) {
      print("Response status code: ${response.statusCode}");

      if (response.statusCode.toString()[0] == "2") {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final WorkContainer responseData = WorkContainer.fromJson(responseBody);
        result
          ..hasError = false
          ..errorMessage = ''
          ..workContainer = responseData
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

class DogResponse extends Response {
  DogResponse({
    this.hasError = false,
    this.errorMessage = '',
    this.workContainer,
  });

  bool hasError;
  String errorMessage;
  int? statusCode;

  WorkContainer? workContainer;
}

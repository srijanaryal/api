import 'dart:convert';

import '../../../Auth/entity/error_container.dart';
import '../../../api/request.dart';
import '../../../api/request_client.dart';
import '../../../api/response.dart';
import '../entity/post_container.dart';

class PostRequest implements Request {
  static const _endPoint = 'https://jsonplaceholder.typicode.com/posts';

  PostRequest();

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

  Future<PostResponse> execute() async {
    final result = PostResponse();
    await RequestClient().get(getUrl(), getHeaders()).then((response) {
      // print("Response status code: ${response.statusCode}");

      if (response.statusCode.toString()[0] == "2") {
        final List<dynamic> responseBody = json.decode(response.body);
        final List<PostContainer> responseData =
            responseBody.map((data) => PostContainer.fromJson(data)).toList();
        result
          ..hasError = false
          ..errorMessage = ''
          ..postContainer = responseData
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

class PostResponse extends Response {
  PostResponse({
    this.hasError = false,
    this.errorMessage = '',
    this.postContainer,
  });

  bool hasError;
  String errorMessage;
  int? statusCode;

  List<PostContainer>? postContainer;
}

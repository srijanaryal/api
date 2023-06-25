import 'package:flutter_learning/shared/singletons/baseurl_singleton.dart';

abstract class Request {
  static const _authentication = 'Authentication';

  String getUrl();

  String? getBody();

  Map<String, String> getHeaders();

  static Map<String, String> createHeader() {
    final authHeader = <String, String>{'x-request-origin': 'mobile'};
    authHeader['Accept'] = 'application/json';
    authHeader['Content-Type'] = 'application/json';
    authHeader['x-request-origin'] = 'mobile';
    return authHeader;
  }

  static String createUrl(String path) {
    String host = "";
    host = BaseURL.getInstance.getBaseUrl();
    return '$host/$path';
  }

  static String createUrlWithId(String path, String id) {
    String host = "";
    host = BaseURL.getInstance.getBaseUrl();
    return '$host/$path/$id';
  }

  static String createGetUrl(String path, Map<String, dynamic> parameters) {
    final uri = Uri.parse(createUrl(path));
    final ret = uri.replace(queryParameters: parameters);
    return ret.toString();
  }

  static String createGetUrlWithId(
      String path, String id, Map<String, dynamic> parameters) {
    final uri = Uri.parse(createUrlWithId(path, id));
    final ret = uri.replace(queryParameters: parameters);
    return ret.toString();
  }

  static String urlEncodeForFormData(Map<String, String> map) {
    return map.keys
        .map((key) =>
            '${Uri.encodeComponent(key)}=${Uri.encodeComponent(map[key]!)}')
        .join('&');
  }

  static Map<String, String> createAuthHeader(String token,
      {bool isFormData = false}) {
    final authHeader = <String, String>{};
    if (token.isNotEmpty) {
      authHeader[_authentication] = token;
      authHeader['Accept'] = 'application/json';
      authHeader['Content-Type'] =
          isFormData ? 'multipart/form-data' : 'application/json';
    }
    return authHeader;
  }

  static Map<String, String> toParamMap(String key, List<String> list) {
    final ret = <String, String>{};
    list.asMap().forEach((index, value) {
      ret['$key[$index]'] = value.toString();
    });
    return ret;
  }
}

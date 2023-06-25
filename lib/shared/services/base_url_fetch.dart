import 'package:flutter/services.dart';

import '../singletons/baseurl_singleton.dart';

class FetchUrl {
  static const platform = MethodChannel('appConfig');
  static Future<String> getBaseUrl() async {
    String baseUrl;
    try {
      final String result = await platform.invokeMethod('getBaseUrl');
      baseUrl = 'Base url $result.';
    } on PlatformException catch (e) {
      baseUrl = "Failed to get baseurl: '${e.message}'.";
    }
    BaseURL.getInstance.setBaseUrl(baseUrl);

    return baseUrl;
  }
}

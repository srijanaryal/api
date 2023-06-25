class BaseURL {
  static BaseURL? _instance;

  BaseURL._();

  static BaseURL get getInstance => _instance ??= BaseURL._();

  String baseUrl = "";

  setBaseUrl(String newUrl) {
    baseUrl = newUrl;
  }

  String getBaseUrl() {
    return baseUrl;
  }
}

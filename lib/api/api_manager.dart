// lib/api/client_selector.dart
import 'http_api_client.dart';
import 'token_provider.dart';
// import 'dio_api_client.dart'; // Add your Dio implementation here

enum ApiClientType { http /*, dio */ }

class ApiClientManager {
  static ApiClient? _client;
  static const String clientUrl = 'https://dummyjson.com/';

  static void configure(ApiClientType type, {TokenProvider? tokenProvider}) {
    switch (type) {
      case ApiClientType.http:
        _client = HttpApiClient(clientUrl, tokenProvider: tokenProvider);
        break;
      // case ApiClientType.dio:
      //   _client = DioApiClient(tokenProvider: tokenProvider);
      //   break;
    }
  }

  static ApiClient get client {
    if (_client == null) {
      throw Exception("API client not configured.");
    }
    return _client!;
  }
}

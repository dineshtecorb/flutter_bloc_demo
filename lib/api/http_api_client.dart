import 'dart:convert';
import 'package:bloc_demo_poc/api/api_response.dart';
import 'package:bloc_demo_poc/api/token_provider.dart';
import 'package:http/http.dart' as http; //Change to your own client package

abstract class ApiClient {
  Future<T> request<T>({
    required String method,
    required String endpoint,
    Map<String, String>? headers,
    Object? body,
    required T Function(dynamic data) fromJson,
  });
}

class HttpApiClient implements ApiClient {
  final String baseUrl;
  final http.Client _client; //Change to your own client
  final Map<String, String> _baseHeaders;
  final TokenProvider? tokenProvider;
//
  HttpApiClient(clientUrl,
      {Map<String, String>? headers, http.Client? client, this.tokenProvider})
      : baseUrl = clientUrl,
        _baseHeaders = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          ...?headers,
        },
        _client = client ?? http.Client();

  @override
  Future<T> request<T>({
    required String method,
    required String endpoint,
    Map<String, String>? headers,
    Object? body,
    required T Function(dynamic json) fromJson,
  }) async {
    final mergedHeaders = {..._baseHeaders};

    // Attach token dynamically if available
    if (tokenProvider != null) {
      final token = await tokenProvider!.getToken();
      if (token != null && token.isNotEmpty) {
        mergedHeaders['Authorization'] = 'Bearer $token';
      }
    }

    if (headers != null) {
      mergedHeaders.addAll(headers);
    }

    final uri = Uri.parse(baseUrl + endpoint);
    final encodedBody = body != null ? jsonEncode(body) : null;

    late final ApiResponse response;

    switch (method.toUpperCase()) {
      case 'GET':
        response =
            HttpApiResponse(await _client.get(uri, headers: mergedHeaders));
        break;
      case 'POST':
        response = HttpApiResponse(
            await _client.post(uri, headers: mergedHeaders, body: encodedBody));
        break;
      case 'PUT':
        response = HttpApiResponse(
            await _client.put(uri, headers: mergedHeaders, body: encodedBody));
        break;
      case 'PATCH':
        response = HttpApiResponse(await _client.patch(uri,
            headers: mergedHeaders, body: encodedBody));
        break;
      case 'DELETE':
        response = HttpApiResponse(await _client.delete(uri,
            headers: mergedHeaders, body: encodedBody));
        break;
      default:
        throw UnsupportedError('HTTP method $method is not supported.');
    }

    return _handleResponse<T>(response, fromJson);
  }

  T _handleResponse<T>(
      ApiResponse response, T Function(dynamic json) fromJson) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (T == String) return response.rawBody as T;
      if (T == bool) return true as T;
      return fromJson(response.data);
    } else {
      throw HttpException('HTTP ${response.statusCode}',
          body: response.rawBody);
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class ApiResponse {
  int get statusCode;
  dynamic get data;
  String get rawBody;
}

class HttpApiResponse implements ApiResponse {
  final http.Response _response;
  HttpApiResponse(this._response);

  @override
  int get statusCode => _response.statusCode;

  @override
  dynamic get data => jsonDecode(_response.body);

  @override
  String get rawBody => _response.body;
}

class HttpException implements Exception {
  final String message;
  final String body;

  HttpException(this.message, {required this.body});

  @override
  String toString() => '$message\nBody: $body';
}

// lib/api/token_provider.dart
abstract class TokenProvider {
  Future<String?> getToken();
}

class MyTokenProvider implements TokenProvider {
  @override
  Future<String?> getToken() async {
    // Fetch from secure storage, shared prefs, etc.
    return 'your-access-token';
  }
}

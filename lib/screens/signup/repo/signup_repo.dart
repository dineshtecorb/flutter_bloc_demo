import 'dart:convert';
import 'package:bloc_demo_poc/api/api_manager.dart';
import 'package:http/http.dart' as http;
import '../model/signup_req.dart';
import '../model/signup_res.dart';

class SignupRepo {
  Future<SignupResModel> signup(SignupReqModel req) async {
    return ApiClientManager.client.request<SignupResModel>(
      method: 'POST',
      endpoint: 'auth/signup',
      body: req.toJson(),
      fromJson: (data) => SignupResModel.fromJson(data),
    );
    /*const url = 
        'https://dummyjson.com/auth/signup'; // Replace with your endpoint
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(req.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return SignupResModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Signup failed');
    }*/
  }
}

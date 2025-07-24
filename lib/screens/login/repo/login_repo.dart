import 'dart:convert';

import 'package:bloc_demo_poc/screens/login/model/login_req.dart';
import 'package:bloc_demo_poc/screens/login/model/login_res.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  Future<LoginResModel> login(String username, String password) async {
    var url = 'https://dummyjson.com/auth/login';
    LoginReqModel loginReqModel =
        LoginReqModel(username: username, password: password);
    http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode(loginReqModel.toJson()),
        headers: {'Content-Type': 'application/json'});
    try {
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return LoginResModel.fromJson(res);
      } else {
        return LoginResModel(email: 'Invalid Details');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

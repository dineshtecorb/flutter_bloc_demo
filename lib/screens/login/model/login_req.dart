class LoginReqModel {
  String? username;
  String? password;

  LoginReqModel({required this.username, required this.password});

  LoginReqModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

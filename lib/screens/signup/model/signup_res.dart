class SignupResModel {
  final String? message;
  final String? email;

  SignupResModel({this.message, this.email});

  factory SignupResModel.fromJson(Map<String, dynamic> json) => SignupResModel(
        message: json['message'],
        email: json['email'],
      );
}

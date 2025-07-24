import 'package:bloc_demo_poc/screens/login/model/login_req.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginReqEvent extends LoginEvent {
  final LoginReqModel? loginReqModel;

  LoginReqEvent({required this.loginReqModel});

  @override
  List<Object?> get props => [loginReqModel];
}

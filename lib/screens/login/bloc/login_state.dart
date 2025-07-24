import 'package:bloc_demo_poc/screens/login/model/login_res.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitailState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLaodingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadedState extends LoginState {
  final LoginResModel? loginResModel;

  LoginLoadedState({required this.loginResModel});
  @override
  List<Object?> get props => [loginResModel];
}

class LoginErrorState extends LoginState {
  final String? error;
  LoginErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

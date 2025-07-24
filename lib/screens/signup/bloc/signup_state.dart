import 'package:equatable/equatable.dart';
import '../model/signup_res.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final SignupResModel res;
  SignupSuccess({required this.res});

  @override
  List<Object?> get props => [res];
}

class SignupFailure extends SignupState {
  final String error;
  SignupFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

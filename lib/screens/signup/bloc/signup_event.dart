import 'package:equatable/equatable.dart';
import '../model/signup_req.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupRequested extends SignupEvent {
  final SignupReqModel signupReqModel;
  SignupRequested({required this.signupReqModel});

  @override
  List<Object?> get props => [signupReqModel];
}

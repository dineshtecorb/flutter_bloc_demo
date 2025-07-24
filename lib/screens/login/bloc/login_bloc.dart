import 'package:bloc_demo_poc/screens/login/bloc/login_event.dart';
import 'package:bloc_demo_poc/screens/login/bloc/login_state.dart';
import 'package:bloc_demo_poc/screens/login/model/login_res.dart';
import 'package:bloc_demo_poc/screens/login/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitailState()) {
    on<LoginReqEvent>((event, emit) async {
      emit(LoginLaodingState());
      try {
        LoginResModel resModel = await LoginRepo().login(
            event.loginReqModel?.username ?? 'NA',
            event.loginReqModel?.password ?? '');
        emit(LoginLoadedState(loginResModel: resModel));
      } catch (e) {
        emit(LoginErrorState(error: e.toString()));
      }
    });
  }
}

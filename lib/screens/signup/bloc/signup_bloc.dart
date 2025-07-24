import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/signup_repo.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepo signupRepo;

  SignupBloc({required this.signupRepo}) : super(SignupInitial()) {
    on<SignupRequested>((event, emit) async {
      emit(SignupLoading());
      try {
        final res = await signupRepo.signup(event.signupReqModel);
        emit(SignupSuccess(res: res));
      } catch (e) {
        emit(SignupFailure(error: e.toString()));
      }
    });
  }
}

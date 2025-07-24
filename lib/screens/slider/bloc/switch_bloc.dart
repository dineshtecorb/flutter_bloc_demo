import 'package:bloc_demo_poc/screens/slider/bloc/switch_event.dart';
import 'package:bloc_demo_poc/screens/slider/bloc/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableSwitchEvent>(_enableOrDisable);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisable(
      EnableOrDisableSwitchEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(value: event.slider));
  }
}

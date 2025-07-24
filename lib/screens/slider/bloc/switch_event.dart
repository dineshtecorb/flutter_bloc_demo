import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EnableOrDisableSwitchEvent extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  final double slider;
  SliderEvent({required this.slider});
  @override
  List<Object> get props => [slider];
}

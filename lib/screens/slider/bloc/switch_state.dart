import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitch;
  final double sliderValue;

  const SwitchState({this.isSwitch = false, this.sliderValue = 0.1});

  SwitchState copyWith({bool? isSwitch, double? value}) {
    return SwitchState(
        isSwitch: isSwitch ?? this.isSwitch, sliderValue: value ?? sliderValue);
  }

  @override
  List<Object> get props => [isSwitch, sliderValue];
}

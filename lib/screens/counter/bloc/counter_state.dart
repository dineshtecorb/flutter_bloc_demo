import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterInitialState extends CounterState {
  final int counter;
  CounterInitialState({required this.counter});

  @override
  List<Object?> get props => [counter];
}

class CounterIncrementState extends CounterState {
  final int incCounter;
  CounterIncrementState({required this.incCounter});

  @override
  List<Object?> get props => [incCounter];
}

class CounterdecrementState extends CounterState {
  final int decCounter;
  CounterdecrementState({required this.decCounter});
  @override
  List<Object?> get props => [decCounter];
}

class NewCounterState extends Equatable {
  final int counter;

  const NewCounterState({this.counter = 1});

  NewCounterState copyWith({int? counter}) {
    return NewCounterState(counter: counter ?? this.counter);
  }

  @override
  List<Object?> get props => [counter];
}

import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterInitialEvent extends CounterEvent {
  final int counter;
  CounterInitialEvent({required this.counter});
  @override
  List<Object?> get props => [counter];
}

class CounterIncrementEvent extends CounterEvent {
  final int incCounter;
  CounterIncrementEvent({required this.incCounter});
  @override
  List<Object?> get props => [incCounter];
}

class CounterDecrementEvent extends CounterEvent {
  final int decCounter;
  CounterDecrementEvent({required this.decCounter});
  @override
  List<Object?> get props => [decCounter];
}

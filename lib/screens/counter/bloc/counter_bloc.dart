import 'package:bloc_demo_poc/screens/counter/bloc/counter_event.dart';
import 'package:bloc_demo_poc/screens/counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState(counter: 0)) {
    //Increment Counter
    // on<CounterIncrementEvent>(_increment);
    // on<CounterDecrementEvent>(_decrement);
    on<CounterIncrementEvent>(
      (event, emit) {
        emit(CounterIncrementState(incCounter: event.incCounter + 1));
      },
    );

    //Decrement Counter
    on<CounterDecrementEvent>(
      (event, emit) {
        emit(CounterdecrementState(decCounter: event.decCounter - 1));
      },
    );
  }

  /* void _increment(CounterIncrementEvent event, Emitter<NewCounterState> emit) {
    int count = state.counter + 1;
    emit(state.copyWith(counter: count));
  }

  void _decrement(CounterDecrementEvent event, Emitter<NewCounterState> emit) {
    int count = state.counter - 1;
    emit(state.copyWith(counter: count));
  }*/
}

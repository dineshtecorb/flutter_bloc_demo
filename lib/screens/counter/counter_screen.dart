import 'package:bloc_demo_poc/screens/counter/bloc/counter_bloc.dart';
import 'package:bloc_demo_poc/screens/counter/bloc/counter_event.dart';
import 'package:bloc_demo_poc/screens/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  int counter = 0;
  CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Counter Screen"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocConsumer<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitialState) {
                  return Text(
                    state.counter.toString(),
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  );
                } else if (state is CounterIncrementState) {
                  return Text(
                    state.incCounter.toString(),
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  );
                } else if (state is CounterdecrementState) {
                  return Text(
                    state.decCounter.toString(),
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  );
                } else {
                  return Container();
                }
              },
              listener: (context, state) {
                /* if (state is CounterIncrementState) {
                  if (state.incCounter == 5) {
                    var snac =
                        const SnackBar(content: Text("Counter Increment"));

                    ScaffoldMessenger.of(context).showSnackBar(snac);
                  }
                } else if (state is CounterdecrementState) {
                  var snac = const SnackBar(content: Text("Counter Decrement"));
                  ScaffoldMessenger.of(context).showSnackBar(snac);
                }*/
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      var bloc = BlocProvider.of<CounterBloc>(context);
                      bloc.add(CounterIncrementEvent(incCounter: counter++));
                    },
                    child: const Text("+",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (counter == 0) {
                        return;
                      }
                      var bloc = BlocProvider.of<CounterBloc>(context);
                      bloc.add(CounterDecrementEvent(decCounter: counter--));
                    },
                    child: const Text(
                      '-',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        )));
  }
}

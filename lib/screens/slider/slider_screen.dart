import 'package:bloc_demo_poc/screens/slider/bloc/switch_bloc.dart';
import 'package:bloc_demo_poc/screens/slider/bloc/switch_event.dart';
import 'package:bloc_demo_poc/screens/slider/bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print("Switch");
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableSwitchEvent());
                        });
                  },
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                print('container');
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                print("Slider");
                return Slider(
                    value: state.sliderValue,
                    onChanged: (value) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(slider: value));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

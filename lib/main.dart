import 'package:bloc_demo_poc/screens/counter/bloc/counter_bloc.dart';
import 'package:bloc_demo_poc/screens/counter/counter_screen.dart';
import 'package:bloc_demo_poc/screens/imagepicker/bloc/imagepicker_bloc.dart';
import 'package:bloc_demo_poc/screens/imagepicker/image_picker_screen.dart';
import 'package:bloc_demo_poc/screens/login/bloc/login_bloc.dart';
import 'package:bloc_demo_poc/screens/login/login_screen.dart';
import 'package:bloc_demo_poc/screens/slider/bloc/switch_bloc.dart';
import 'package:bloc_demo_poc/screens/slider/slider_screen.dart';
import 'package:bloc_demo_poc/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagepickerBloc(ImagePickerUtils()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ImagePickerScreen(),
      ),
    );
  }
}

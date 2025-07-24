import 'package:bloc_demo_poc/screens/counter/counter_screen.dart';
import 'package:bloc_demo_poc/screens/login/bloc/login_bloc.dart';
import 'package:bloc_demo_poc/screens/login/bloc/login_event.dart';
import 'package:bloc_demo_poc/screens/login/bloc/login_state.dart';
import 'package:bloc_demo_poc/screens/login/model/login_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitailState || state is LoginLoadedState) {
              return Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(hintText: 'Username'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var bloc = BlocProvider.of<LoginBloc>(context);
                        LoginReqModel reqModel = LoginReqModel(
                            username: usernameController.text,
                            password: passwordController.text);
                        bloc.add(LoginReqEvent(loginReqModel: reqModel));
                        if (reqModel.username!.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CounterScreen()),
                          );
                        }
                      },
                      child: Text(
                          state is LoginLoadedState ? "Logged In" : "Login")),
                  const SizedBox(
                    height: 20,
                  ),
                  if (state is LoginLoadedState)
                    Text(state.loginResModel!.email.toString())
                ],
              );
            } else if (state is LoginLaodingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoginErrorState) {
              return Center(child: Text(state.error.toString()));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class $ {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_event.dart';
import 'bloc/signup_state.dart';
import 'model/signup_req.dart';
import 'repo/signup_repo.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(signupRepo: SignupRepo()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Signup')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              if (state is SignupLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SignupSuccess) {
                return Center(
                    child: Text('Signup Success:  [${state.res.email ?? ''}'));
              }
              if (state is SignupFailure) {
                return Center(child: Text('Error: ${state.error}'));
              }
              return Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(hintText: 'Username'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final req = SignupReqModel(
                        username: usernameController.text,
                        password: passwordController.text,
                        email: emailController.text,
                      );
                      context
                          .read<SignupBloc>()
                          .add(SignupRequested(signupReqModel: req));
                    },
                    child: const Text('Signup'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

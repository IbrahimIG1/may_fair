import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/features/screens/login/cubit/cubit/login_cubit.dart';
import 'package:may_fair/features/screens/login/cubit/cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: loginCubit.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: loginCubit.passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  loginCubit.login();
                },
                child: const Text('Login with Email'),
              ),
              const SizedBox(height: 20),
               ElevatedButton(
                onPressed: loginCubit.loginWithGoogle,
                child: const Text('Login with Google'),
              ),
            ],
          ),
        );
      },
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/repos/login_repo.dart';
import 'package:may_fair/features/screens/login/cubit/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);


final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
  void login() {
    loginRepo.login(email: emailController.text, password: passwordController.text);
  }
  void loginWithGoogle() {
    loginRepo.loginWithGoolge();
  }
}

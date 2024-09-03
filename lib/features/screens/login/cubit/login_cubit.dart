import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/repos/login_repo.dart';
import 'package:may_fair/features/screens/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;

  LoginCubit(
    this.loginRepo,
  ) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  void login(BuildContext context) {
    loginRepo.login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  void loginWithGoogle(BuildContext context) async {
    emit(LoadingStateLogin());
    try {
      await loginRepo.loginWithGoolge(context).then((value) {
        emit(SuccessStateLogin());
      });
    } on Exception catch (e) {
      SnackBar(content: Text('Error in Login with google method $e'));
      emit(ErrorStateLogin());
    }
  }

  void passwordVisibility() {
    isObscure = !isObscure;
    emit(ObscureStateLogin());
  }
}

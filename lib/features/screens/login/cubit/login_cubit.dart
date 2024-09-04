import 'package:firebase_auth/firebase_auth.dart';
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
  bool isDriver = false;
  bool isCustomer = true;
  double googleSignInButtonOpacity = 1;
  Color borderColor = Colors.white;

  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> login({required BuildContext context}) async {
    emit(LoadingStateLogin());
    loginRepo
        .login(
            email: emailController.text,
            password: passwordController.text,
            context: context)
        .then((value) {
      emit(SuccessStateLogin());
    }).catchError((error) {
      emit(ErrorStateLogin());
    });
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

  void changeBorderColor() {
    isDriver = !isDriver;
    isCustomer = !isCustomer;
    if (isCustomer) {
      googleSignInButtonOpacity = 1;
    } else {
      googleSignInButtonOpacity = 0;
    }
    emit(ChangeBrderColorStateLogin());
  }
}

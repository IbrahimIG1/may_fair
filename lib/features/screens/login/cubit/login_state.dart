import 'package:firebase_auth/firebase_auth.dart';
import 'package:may_fair/core/models/error_handler_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingStateLogin extends LoginState {}
class LoadingWithGoolgeStateLogin extends LoginState {}

class SuccessStateLogin extends LoginState {
  User user;

  SuccessStateLogin(this.user);
}

class ErrorStateLogin extends LoginState {
  ApiErrorModel apiErrorModel;
  ErrorStateLogin(this.apiErrorModel);
}

class ObscureStateLogin extends LoginState {}

class ChangeBrderColorStateLogin extends LoginState {}

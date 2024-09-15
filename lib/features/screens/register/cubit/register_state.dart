import 'package:firebase_auth/firebase_auth.dart';
import 'package:may_fair/core/models/error_handler_model.dart';

abstract class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class LoadingStateRegister extends RegisterState {}
final class LoadingWIthGoogleStateRegister extends RegisterState {}

final class SuccessStateRegister extends RegisterState {
  User user;
  SuccessStateRegister(this.user);
}

final class ErrorStateRegister extends RegisterState {
    ApiErrorModel apiErrorModel;
  ErrorStateRegister(this.apiErrorModel);
}


class ObscureStateLogin extends RegisterState {}

import 'package:may_fair/core/models/error_handler_model.dart';
import 'package:may_fair/core/models/user_model.dart';

abstract class DriverState {}

final class DriverInitial extends DriverState {}

final class LoadingDriversState extends DriverState {}

final class GetAllDriversSuccessState extends DriverState {
  List<UserModel> data;
  GetAllDriversSuccessState(this.data);
}

final class GetAllDriversErrorState extends DriverState {
  final ApiErrorModel error;

  GetAllDriversErrorState(this.error);
}

final class AddDriverState extends DriverState {}

final class UpdateDriverState extends DriverState {}

final class DeleteDriverState extends DriverState {}


abstract class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class LoadingStateRegister extends RegisterState {}
final class SuccessStateRegister extends RegisterState {}
final class ErrorStateRegister extends RegisterState {}

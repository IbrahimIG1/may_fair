import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/repos/Register_repo.dart';
import 'package:may_fair/features/screens/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit(this.registerRepo) : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final bool isObscure = false;

  void registerWithEmailAndPassword({required BuildContext context}) async {
    await registerRepo.register(
      email: mailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  void registerWithGoogle({required BuildContext context}) async {
    await registerRepo.registerWithGoolge(context);
  }
}

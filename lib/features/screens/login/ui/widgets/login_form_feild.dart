import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/widgets/app_text_feild.dart';
import 'package:may_fair/features/screens/login/cubit/login_cubit.dart';
import 'package:may_fair/generated/l10n.dart';

class LoginFormFeild extends StatelessWidget {
  const LoginFormFeild(
      {super.key,
      required this.isObcure,
      required this.emailController,
      required this.passwordController,
      required this.iconPress});
  final bool isObcure;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function iconPress;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormFeild(
              hintText: S.current.email,
              controller: emailController,
              validator: (value) {
                if (value!.isNullOrEmpty()) {
                  return S.of(context).please_enter_email;
                }
              }),
          verticalSpace(10),
          //* password
          AppTextFormFeild(
            hintText: S.current.password,
            controller: passwordController,
            validator: (value) {
              if (value!.isNullOrEmpty()) {
                return S.of(context).please_enter_password;
              }
            },
            isObscure: isObcure,
            suffixIcon: IconButton(
                onPressed: () {
                  iconPress();
                },
                icon: Icon(isObcure ? Icons.visibility_off : Icons.visibility)),
          ),
        ],
      ),
    );
  }
}

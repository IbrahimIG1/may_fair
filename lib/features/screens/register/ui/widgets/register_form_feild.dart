import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/widgets/app_text_feild.dart';
import 'package:may_fair/features/screens/register/cubit/register_cubit.dart';
import 'package:may_fair/generated/l10n.dart';

class RegisterFormFeild extends StatelessWidget {
  const RegisterFormFeild(
      {super.key,
      required this.isObcure,
      required this.nameController,
      required this.passwordController,
      required this.iconPress,
      required this.phoneController,
      required this.mailController});
  final bool isObcure;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final TextEditingController mailController;
  final Function iconPress;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          //* name
          AppTextFormFeild(
              hintText: S.current.user_name,
              controller: nameController,
              validator: (value) {
                if (value!.isNullOrEmpty()) {
                  return S.of(context).please_enter_user_name;
                }
              }),
          verticalSpace(15),
          //* phone
          AppTextFormFeild(
              hintText: S.current.phone,
              controller: phoneController,
              validator: (value) {
                if (value!.isNullOrEmpty()) {
                  return S.of(context).please_enter_phone;
                }
              }),
          verticalSpace(15),
          //* email
          AppTextFormFeild(
            hintText: S.current.email,
            controller: mailController,
            validator: (value) {
              if (value!.isNullOrEmpty()) {
                return S.of(context).please_enter_email;
              }
            },
          ),
          verticalSpace(15),

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

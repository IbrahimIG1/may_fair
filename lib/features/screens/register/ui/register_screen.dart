import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/core/widgets/app_button.dart';
import 'package:may_fair/features/screens/register/cubit/register_cubit.dart';
import 'package:may_fair/features/screens/register/cubit/register_state.dart';
import 'package:may_fair/features/screens/register/ui/widgets/register_form_feild.dart';
import 'package:may_fair/generated/l10n.dart';
import '../../../../core/widgets/snack_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is ErrorStateRegister) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(appSnackBar(
                title: 'Error',
                message: state.apiErrorModel.message!,
                contentType: ContentType.failure));
        } else if (state is SuccessStateRegister) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(appSnackBar(
                title: 'Hello',
                message: state.user.displayName ??state.user.email!,
                contentType: ContentType.success));
        }
      },
      builder: (context, state) {
        RegisterCubit registerCubit = RegisterCubit.get(context);
        return state is LoadingStateRegister
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: kIsWeb
                                      ? NetworkImage('assets/images/logo.png')
                                      : AssetImage('assets/images/logo.png'))),
                        ),
                        verticalSpace(20),
                        Text(
                          S.current.welcome,
                          style: TextStyles.font24YellowBold,
                        ),
                        verticalSpace(10),
                        Text(
                          S.of(context).welcome_register_text,
                          style: TextStyles.font14MediumWhite
                              .copyWith(height: 1.7),
                        ),
                        verticalSpace(20),
                        //* Email

                        RegisterFormFeild(
                            isObcure: registerCubit.isObscure,
                            nameController: registerCubit.nameController,
                            passwordController:
                                registerCubit.passwordController,
                            iconPress: () {
                              registerCubit.passwordVisibility();
                            },
                            phoneController: registerCubit.phoneController,
                            mailController: registerCubit.mailController),
                        verticalSpace(20),
                        //* Register Button
                        AppTextButton(
                            textStyle: TextStyles.font14MediumWhite,
                            text: S.current.register,
                            onpressed: () {
                              if (registerCubit.formKey.currentState!
                                  .validate()) {
                                registerCubit.registerWithEmailAndPassword(
                                    context: context);
                              }
                              // print(isUserLogin.toString());
                              // print(userUId.toString());
                            }),
                        // verticalSpace(20),
                        // //* Login With Google Button
                        // AppTextButton(
                        //     textStyle: TextStyles.font14MediumWhite,
                        //     iconData: Icons.mail_outline,
                        //     text: S.current.login_with_google,
                        //     backgroundColor: Colors.red.withOpacity(0.9),
                        //     onpressed: () {
                        //       registerCubit.registerWithGoogle(context:context);
                        //     }),
                      ],
                    ),
                  ),
                ),
              );
      },
    ));
  }
}

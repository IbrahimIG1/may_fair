import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/router/routes.dart';
import 'package:may_fair/core/theme/text_styles.dart';
import 'package:may_fair/core/widgets/app_button.dart';
import 'package:may_fair/core/widgets/snack_bar.dart';
import 'package:may_fair/features/screens/login/cubit/login_cubit.dart';
import 'package:may_fair/features/screens/login/cubit/login_state.dart';
import 'package:may_fair/features/screens/login/ui/widgets/is_driver_button.dart';
import 'package:may_fair/features/screens/login/ui/widgets/login_form_feild.dart';
import 'package:may_fair/features/screens/login/ui/widgets/not_have_account.dart';
import 'package:may_fair/features/screens/login/ui/widgets/or_sign_with_text.dart';
import 'package:may_fair/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ErrorStateLogin) {
          // Show error message as a SnackBar

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(appSnackBar(
                title: "Error ${state.apiErrorModel.code ?? ""}",
                message: state.apiErrorModel.message!,
                contentType: ContentType.failure));
        } else if (state is SuccessStateLogin) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(appSnackBar(
                title: 'Welcom',
                message: state.user.email!,
                contentType: ContentType.success));
        }
      },
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return state is LoadingStateLogin
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
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      NetworkImage('assets/images/logo.png'))),
                        ),
                        verticalSpace(20),
                        Text(
                          S.current.welcome,
                          style: TextStyles.font24YellowBold,
                        ),
                        verticalSpace(10),
                        Text(
                          S.of(context).welcome_login_text,
                          style: TextStyles.font14MediumWhite
                              .copyWith(height: 1.7),
                        ),
                        verticalSpace(20),
                        //* Email
                        LoginFormFeild(
                          iconPress: loginCubit.passwordVisibility,
                          isObcure: loginCubit.isObscure,
                          emailController: loginCubit.emailController,
                          passwordController: loginCubit.passwordController,
                        ),
                        verticalSpace(20),

                        Row(
                          children: [
                            Expanded(
                                child: IsDriverButton(
                              onTap: loginCubit.changeBorderColor,
                              txt: S.current.customer,
                              clicked: loginCubit.isCustomer,
                            )),
                            horizontalSpace(10),
                            Expanded(
                                child: IsDriverButton(
                              onTap: loginCubit.changeBorderColor,
                              txt: S.current.driver,
                              clicked: loginCubit.isDriver,
                            )),
                          ],
                        ),
                        verticalSpace(20),
                        //* Login Button
                        AppTextButton(
                            textStyle: TextStyles.font14MediumWhite,
                            text: S.current.login,
                            onpressed: () {
                              if (loginCubit.formKey.currentState!.validate()) {
                                loginCubit.login(context: context);
                              }
                              // print(isUserLogin.toString());
                              // print(userUId.toString());
                            }),
                        verticalSpace(20),
                        const OrSignWithText(),
                        verticalSpace(20),
                        //* Login With Google Button
                        // if (loginCubit.isCustomer)
                        AppTextButton(
                            textStyle: TextStyles.font14MediumWhite,
                            iconData: Icons.mail_outline,
                            text: S.current.login_with_google,
                            backgroundColor: Colors.red.withOpacity(0.9),
                            onpressed: () {
                              loginCubit.loginWithGoogle(context);
                            }),

                        verticalSpace(20),
                        // if (loginCubit.isCustomer)
                        NotHaveAccount(
                          onTap: () {
                            context.pushNamed(Routes.registerScreen);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    ));
  }
}

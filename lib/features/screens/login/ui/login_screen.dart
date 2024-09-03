import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_fair/core/helper/spacer_helper.dart';
import 'package:may_fair/core/widgets/app_text_feild.dart';
import 'package:may_fair/features/screens/login/cubit/login_cubit.dart';
import 'package:may_fair/features/screens/login/cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return state is LoadingStateLogin
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      height: 100.h,
                      width: 100.w,
                      child: Icon(
                        Icons.place_rounded,
                        size: 100,
                      ),
                    ),
                    verticalSpace(20),
                    AppTextFormFeild(hintText: "Email", validator: (value) {}),
                    verticalSpace(10),
                    AppTextFormFeild(
                      hintText: "Password",
                      validator: (value) {},
                      isObscure: loginCubit.isObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            loginCubit.passwordVisibility();
                          },
                          icon: Icon(loginCubit.isObscure ? Icons.visibility_off:Icons.visibility)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        loginCubit.login(context);
                      },
                      child: const Text('Login with Email'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        loginCubit.loginWithGoogle(context);
                      },
                      child: const Text('Login with Google'),
                    ),
                  ],
                ),
              );
      },
    ));
  }
}

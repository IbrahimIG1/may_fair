import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/di/dependencey_injection.dart.dart';
import 'package:may_fair/core/router/routes.dart';
import 'package:may_fair/features/screens/home/home_screen.dart';
import 'package:may_fair/features/screens/login/cubit/login_cubit.dart';
import 'package:may_fair/features/screens/login/ui/login_screen.dart';
import 'package:may_fair/features/screens/register/cubit/register_cubit.dart';
import 'package:may_fair/features/screens/register/ui/register_screen.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    print('generateRouter start');
    switch (settings.name) {
      //* home
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      //* login
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
//* register
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Route Here'),
            ),
          ),
        );
    }
  }
}

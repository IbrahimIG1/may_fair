import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_fair/core/constants/constants.dart';
import 'package:may_fair/core/di/dependencey_injection.dart.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/shared_prefrence.dart';
import 'package:may_fair/core/router/app_router.dart';
import 'package:may_fair/core/router/routes.dart';
import 'package:may_fair/core/theme/main_theme.dart';
import 'package:may_fair/features/screens/chat_screen/chat_screen.dart';
import 'package:may_fair/features/screens/home/cubit/home_cubit.dart';
import 'package:may_fair/features/screens/home/ui/home_screen.dart';
import 'package:may_fair/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  await chekUserLogin();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            locale: const Locale('ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            theme: appTheme(),
            initialRoute: isUserLogin! ? Routes.homeScreen : Routes.loginScreen,
            onGenerateRoute: AppRouter().generateRouter,
            home: BlocProvider(
              create: (context) => HomeCubit(),
              child: HomeScreen(),
            ),
          );
        });
  }
}

chekUserLogin() async {
  await SharedPrefImpl.initSharedPreference();
  SharedPrefImpl sharedPref = SharedPrefImpl();
  userUId = sharedPref.getString('UserUID') ?? "";

  if (userUId.isNullOrEmpty()) {
    isUserLogin = false;
  } else {
    isUserLogin = true;
  }

  print('userUId = $userUId');
  print(sharedPref.getString('UserUID'));
}

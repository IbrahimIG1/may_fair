import 'dart:async';

import 'package:flutter/material.dart';
import 'package:may_fair/core/constants/constants.dart';
import 'package:may_fair/core/di/dependencey_injection.dart.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/shared_prefrence.dart';
import 'package:may_fair/core/router/app_router.dart';
import 'package:may_fair/core/router/routes.dart';
import 'package:may_fair/features/screens/home/home_screen.dart';
import 'package:may_fair/features/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  await chekUserLogin();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute:  isUserLogin! ? Routes.homeScreen :Routes.loginScreen ,
      onGenerateRoute: AppRouter().generateRouter,
      home:  HomeScreen(),
    );
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

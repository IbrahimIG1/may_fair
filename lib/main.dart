import 'package:flutter/material.dart';
import 'package:may_fair/core/di/dependencey_injection.dart.dart';
import 'package:may_fair/core/router/app_router.dart';
import 'package:may_fair/core/router/routes.dart';
import 'package:may_fair/features/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp().then((value) {
    print("steup init");
  });
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
      initialRoute: Routes.loginScreen,
      onGenerateRoute: AppRouter().generateRouter,
      home: const LoginScreen(),
    );
  }
}

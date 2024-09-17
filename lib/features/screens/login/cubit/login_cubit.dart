import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/constants/constants.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/shared_prefrence.dart';
import 'package:may_fair/core/models/user_model.dart';
import 'package:may_fair/core/network_services/cloud_firestore.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';
import 'package:may_fair/core/repos/login_repo.dart';
import 'package:may_fair/core/router/routes.dart';
import 'package:may_fair/features/screens/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;

  LoginCubit(
    this.loginRepo,
  ) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  bool isDriver = false;
  bool isCustomer = true;
  double googleSignInButtonOpacity = 1;
  Color borderColor = Colors.white;

  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //* Login with Email and Password
  Future<void> login({required BuildContext context}) async {
    emit(LoadingStateLogin());
    final response = await loginRepo.login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    response.when(success: (user) {
      print(user.uid);
      print(user);
      SharedPrefImpl().setSecureString('UserUID', user.uid);
      SharedPrefImpl().setBool('isDriver', isDriver);
      context.pushReplacementNamed(Routes.homeScreen);
      emit(SuccessStateLogin(user));
    }, failure: (apiErrorModel) {
      emit(ErrorStateLogin(apiErrorModel));
    });
  }

  
  late UserModel userModel;

//* Login with google account
  void loginWithGoogle(BuildContext context) async {
    String collectionResult = UserType == UserEnum.customer ? "Users" : "Drivers";
    print(collectionResult);
    emit(LoadingWithGoolgeStateLogin());
    final response =
        await loginRepo.loginWithGoolge(collection: collectionResult);
    response.when(success: (user) async {
      context.pushReplacementNamed(Routes.homeScreen);
      userModel = UserModel(
          email: user.email ?? "Email not found",
          status: true,
          name: user.displayName ?? "",
          phone: user.phoneNumber ?? "");

      SharedPrefImpl().setSecureString('UserUID', user.uid);
      SharedPrefImpl().setBool('isDriver', isDriver);

      FirebaseFactory firebaseFactory = FirebaseFactoryImpl();
      CloudFirestoreServicesImp(firebaseFactory)
          .addData(collectionResult, userModel.toMap(),user.uid);
      emit(SuccessStateLogin(user));
    }, failure: (apiErrorModel) {
      emit(ErrorStateLogin(apiErrorModel));
    });
  }

  void passwordVisibility() {
    isObscure = !isObscure;
    emit(ObscureStateLogin());
  }

  void changeBorderColor() {
    isDriver = !isDriver;
    isCustomer = !isCustomer;
    if (isCustomer) {
      UserType = UserEnum.customer;
      print(UserType);
    } else {
      // googleSignInButtonOpacity = 0;
      UserType = UserEnum.driver;
      print(UserType);
    }
    emit(ChangeBrderColorStateLogin());
  }
}

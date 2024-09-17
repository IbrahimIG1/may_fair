import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:may_fair/core/constants/constants.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/shared_prefrence.dart';
import 'package:may_fair/core/models/user_model.dart';
import 'package:may_fair/core/network_services/cloud_firestore.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';
import 'package:may_fair/core/repos/Register_repo.dart';
import 'package:may_fair/core/router/routes.dart';
import 'package:may_fair/features/screens/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit(this.registerRepo) : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  late UserModel userModel;

//* Register with Email and password
  void registerWithEmailAndPassword({required BuildContext context}) async {
    String collectionResult =
        UserType == UserEnum.customer ? "Users" : "Drivers";

    emit(LoadingStateRegister());
    userModel = UserModel(
        email: mailController.text,
        status: true,
        name: nameController.text,
        phone: phoneController.text);

    print(UserType.toString());
    final response = await registerRepo.register(
        password: passwordController.text,
        userModel: userModel,
        collection: collectionResult);
    response.when(success: (user) {
      String collection = collectionResult;
      FirebaseFactory firebaseFactory = FirebaseFactoryImpl();
      CloudFirestoreServicesImp(firebaseFactory)
          .addData(collection, userModel.toMap(), user.uid);
      SharedPrefImpl().setSecureString('UserUID', user.uid);
      SharedPrefImpl()
          .setBool('isDriver', UserType == UserEnum.customer ? false : true);
      context.pushReplacementNamed(Routes.homeScreen);
      emit(SuccessStateRegister(user));
    }, failure: (error) {
      emit(ErrorStateRegister(error));
    });
  }

//* Register with google account
  void registerWithGoogle({required BuildContext context}) async {
    String collectionResult =
        UserType == UserEnum.customer ? "Users" : "Drivers";

    emit(LoadingWIthGoogleStateRegister());
    final response = await registerRepo.registerWithGoolge(context);
    response.when(success: (user) {
      userModel = UserModel(
          email: user.email ?? "Email not found",
          status: true,
          name: user.displayName ?? "",
          phone: user.phoneNumber ?? "");
      SharedPrefImpl().setSecureString('UserUID', user.uid);
      String collection = collectionResult;
      FirebaseFactory firebaseFactory = FirebaseFactoryImpl();
      CloudFirestoreServicesImp(firebaseFactory)
          .addData(collection, userModel.toMap(), user.uid);
      context.pushReplacementNamed(Routes.homeScreen);

      emit(SuccessStateRegister(user));
    }, failure: (error) {
      emit(ErrorStateRegister(error));
    });
  }

  void passwordVisibility() {
    isObscure = !isObscure;
    emit(ObscureStateLogin());
  }
}

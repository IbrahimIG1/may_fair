import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:may_fair/core/helper/firebase_error_handler.dart';
import 'package:may_fair/core/models/user_model.dart';
import 'package:may_fair/core/network_services/auth_services.dart';
import 'package:may_fair/core/network_services/networking_result.dart';

import '../network_services/cloud_firestore.dart';

class RegisterRepo {
  final AuthNetworkeServices _registerNetworkService;
  final CloudFirestoreServices cloudFirestoreServices;
  RegisterRepo(this._registerNetworkService, this.cloudFirestoreServices);

  Future<ApiResult<User>> registerWithGoolge(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _registerNetworkService.googleSignIn();
      return ApiResult.success(userCredential.user!);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }

  Future<ApiResult<User>> register(
      {required UserModel userModel,
      required String password,
      required String collection}) async {
    try {
      UserCredential userCredential =
          await _registerNetworkService.registerWithUserAndPassword(
        password: password,
        email: userModel.email,
      );
      cloudFirestoreServices.addData(collection, userModel.toMap());
      return ApiResult.success(userCredential.user!);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }
}

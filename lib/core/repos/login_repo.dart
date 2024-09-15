import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:may_fair/core/helper/firebase_error_handler.dart';
import 'package:may_fair/core/network_services/auth_services.dart';
import 'package:may_fair/core/network_services/networking_result.dart';

class LoginRepo {
  final AuthNetworkeServices _loginNetworkService;
  LoginRepo(this._loginNetworkService);

  Future<ApiResult<User>> loginWithGoolge(
      {required String collection}) async {
    try {
      UserCredential userCredential = await _loginNetworkService.googleSignIn();
      return ApiResult.success(userCredential.user!);
    } on Exception catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }

  Future<ApiResult<User>> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final UserCredential userCredential =
          await _loginNetworkService.loginWithUserAndPassword(email, password);
      return ApiResult.success(userCredential.user!);
    } catch (error) {
      print("Error in failure Login $error");
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }
}

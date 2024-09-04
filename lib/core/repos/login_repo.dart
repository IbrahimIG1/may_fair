import 'package:flutter/material.dart';
import 'package:may_fair/core/network_services/auth_services.dart';

class LoginRepo {
  final AuthNetworkeServices _loginNetworkService;
  LoginRepo(this._loginNetworkService);

  Future<void> loginWithGoolge(BuildContext context) async {
    await _loginNetworkService.googleSignIn(context);
  }

  Future<void> login({required String email, required String password,required BuildContext context}) async {
  _loginNetworkService.loginWithUserAndPassword(email, password,context);
  }
}

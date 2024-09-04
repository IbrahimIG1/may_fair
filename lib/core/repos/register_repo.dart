import 'package:flutter/material.dart';
import 'package:may_fair/core/network_services/auth_services.dart';

class RegisterRepo {
  final AuthNetworkeServices _registerNetworkService;
  RegisterRepo(this._registerNetworkService);

  Future<void> registerWithGoolge(BuildContext context) async {
    await _registerNetworkService.googleSignIn(context);
  }

  Future<void> register({required String email, required String password,required BuildContext context}) async {
  _registerNetworkService.registerWithUserAndPassword(email, password,context);
  }
}

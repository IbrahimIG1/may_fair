import 'package:may_fair/core/network_services/auth_services.dart';

class LoginRepo {
  final AuthNetworkeServices _loginNetworkService;
  LoginRepo(this._loginNetworkService);

  Future<void> loginWithGoolge() async {
    _loginNetworkService.googleSignIn();
  }

  Future<void> login({required String email, required String password}) async {
    _loginNetworkService.loginWithUserAndPassword(email, password);
  }
}

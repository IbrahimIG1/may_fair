import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:may_fair/core/helper/extensions.dart';
import 'package:may_fair/core/helper/shared_prefrence.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';
import 'package:may_fair/core/router/routes.dart';

abstract class AuthNetworkeServices {
  Future<void> googleSignIn(BuildContext context);
  Future<void> loginWithUserAndPassword(
      String email, String password, BuildContext context);
  // Future<void> signOut();
}

class AuthNetworkServicesImpl implements AuthNetworkeServices {
  final FirebaseFactory firebaseFactory;
  final SharedPrefImpl sharedPreferences;
  AuthNetworkServicesImpl(this.firebaseFactory, this.sharedPreferences);

  @override
  Future<void> loginWithUserAndPassword(
      String email, String password, BuildContext context) async {
          print(' start Function signInWithEmailAndPassword');
    // SharedPref sharedPref = SharedPrefImpl();
    FirebaseAuth firebaseAuth = firebaseFactory.getFirebaseAuth();
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          print(' in Function signInWithEmailAndPassword');
      context.pushReplacementNamed(Routes.homeScreen);
      print(value.user!.uid);

      sharedPreferences.setString('UserUID', value.user?.uid);
    });
  }

  @override
  Future<void> googleSignIn(BuildContext context) async {
    FirebaseAuth auth = firebaseFactory.getFirebaseAuth();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential).then((value) {
        context.pushReplacementNamed(Routes.homeScreen);
        sharedPreferences.setString('UserUID', value.user?.uid);
      });
      // User? getUser = auth.currentUser!;
    } catch (e) {
      print("Exeption in login with google >>> $e ");
    }
  }
}

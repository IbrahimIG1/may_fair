import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';

abstract class AuthNetworkeServices {
  Future<void> googleSignIn();
  Future<void> loginWithUserAndPassword(String email, String password);
  // Future<void> signOut();
}

class AuthNetworkServicesImpl implements AuthNetworkeServices {
  final FirebaseFactory firebaseFactory;
  AuthNetworkServicesImpl(this.firebaseFactory);

  @override
  Future<void> loginWithUserAndPassword(String email, String password) async {
    // SharedPref sharedPref = SharedPrefImpl();
    FirebaseAuth firebaseAuth = firebaseFactory.getFirebaseAuth();
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      // sharedPref.setSecureString('user_id', value.user!.uid);
    });
  }

  @override
  Future<void> googleSignIn() async {
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
      await auth.signInWithCredential(credential);
    } catch (e) {
      print("Exeption in login with google >>> $e ");
    }
  }
}

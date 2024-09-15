import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:may_fair/core/helper/shared_prefrence.dart';
import 'package:may_fair/core/network_services/firebase_services.dart';

abstract class AuthNetworkeServices {
  Future<UserCredential> googleSignIn();
  Future<UserCredential> loginWithUserAndPassword(
      String email, String password);
  Future<UserCredential> registerWithUserAndPassword({
    required String password,
    required String email,
  });
  // Future<void> signOut();
}

class AuthNetworkServicesImpl implements AuthNetworkeServices {
  final FirebaseFactory firebaseFactory;
  final SharedPrefImpl sharedPreferences;
  AuthNetworkServicesImpl(this.firebaseFactory, this.sharedPreferences);

  @override
  Future<UserCredential> loginWithUserAndPassword(
      String email, String password) async {
    FirebaseAuth firebaseAuth = firebaseFactory.getFirebaseAuth();
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // Successful sign-in

  @override
  Future<UserCredential> googleSignIn() async {
    FirebaseAuth auth = firebaseFactory.getFirebaseAuth();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await auth.signInWithCredential(credential);
  }

  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // try {
  //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   UserModel userModel = UserModel(
  //       name: googleUser.displayName ?? googleUser.email,
  //       email: googleUser.email,
  //       photo: googleUser.photoUrl ?? "");
  //   await auth.signInWithCredential(credential).then((value) {
  //     context.pushReplacementNamed(Routes.homeScreen);
  //     sharedPreferences.setString('UserUID', value.user?.uid);
  //   });
  //   //* Add Data To Cloud FireStore
  //   await CloudFirestoreServicesImp(firebaseFactory)
  //       .addData(collection, userModel.toMap());
  //   return null; // Successful sign-in
  // } on FirebaseAuthException catch (e) {
  //   ApiErrorModel errorMessage = ApiErrorHandler.handleException(e);
  //   print(errorMessage);
  //   return errorMessage.message;
  // } catch (e) {
  //   return "An unknown error occurred."; // Handle any other errors
  // }
// Add data to Firestore after login

  @override
  Future<UserCredential> registerWithUserAndPassword(
      {required String password, required String email}) async {
    FirebaseAuth auth = firebaseFactory.getFirebaseAuth();
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}

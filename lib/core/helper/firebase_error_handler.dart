import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:may_fair/core/models/error_handler_model.dart';
import 'package:may_fair/generated/l10n.dart';

class ApiErrorHandler {
  // Convert FirebaseAuthException to ErrorHandler
  static ApiErrorModel handleException(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return ApiErrorModel(message: S.current.error_invalid_email);
        case 'user-disabled':
          return ApiErrorModel(message: S.current.error_user_disabled);
        case 'user-not-found':
          return ApiErrorModel(message: S.current.error_user_not_found);
        case 'wrong-password':
          return ApiErrorModel(message: S.current.error_wrong_password);
        case 'email-already-in-use':
          return ApiErrorModel(message: S.current.error_email_already_in_use);
        case 'invalid-credential':
          return ApiErrorModel(message: S.current.error_invalid_credential);
        default:
          return ApiErrorModel(message: S.current.error_unknown);
      }
    } else if (error is GoogleSignInAccount) {
      return ApiErrorModel(
          message: S.current.error_google_sign_in_authentication);
    } else if (error is GoogleSignInAuthentication) {
      return ApiErrorModel(message: S.current.error_google_sign_in_account);
    } else if (error is FirebaseException) {
      // Handle Firestore and other Firebase exceptions
      switch (error.code) {
        case 'permission-denied':
          return ApiErrorModel(message: S.current.error_permission_denied);
        case 'unavailable':
          return ApiErrorModel(message: S.current.error_unavailable);
        case 'not-found':
          return ApiErrorModel(message: S.current.error_not_found);
        case 'already-exists':
          return ApiErrorModel(message: S.current.error_already_exists);
        case 'cancelled':
          return ApiErrorModel(message: S.current.error_cancelled);
        case 'deadline-exceeded':
          return ApiErrorModel(message: S.current.error_deadline_exceeded);
        case 'resource-exhausted':
          return ApiErrorModel(message: S.current.error_resource_exhausted);
        case 'failed-precondition':
          return ApiErrorModel(message: S.current.error_failed_precondition);
        default:
          return ApiErrorModel(message: S.current.error_unknown);
      }
    } else {
      return ApiErrorModel(
        message: S.current.error_unknown,
      );
    }
  }
}

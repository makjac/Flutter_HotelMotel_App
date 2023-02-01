import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/repository/user_repository/user_repository.dart';
import 'package:hotel_motel/service/analitics_service/analitics_service.dart';
import 'package:hotel_motel/service/auth_service/base_auth_service.dart';
import 'package:hotel_motel/utils/userSharedPreferences.dart';

import '../../../models/user_model.dart';

class AuthService extends BaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> getUser() async {
    var firebaseUser = _firebaseAuth.currentUser;
    return UserModel(
        uid: firebaseUser?.uid,
        displayName: firebaseUser?.displayName,
        avatarUrl: null);
  }

  @override
  Future<void> signUp({required String email, required String passwd}) async {
    try {
      final UserCredential user = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: passwd);
      await locator
          .get<UserRepository>()
          .initUserDocuments(user.user!.uid, email);
    } on FirebaseAuthException catch (e) {
      await locator
          .get<AnaliticsService>()
          .logAuthError(authType: "Sign Up", error: e.code);
      if (e.code == "email-already-in-use") {
        throw Exception(
            "There already exists an account with the given email address");
      }
      if (e.code == "weak-password") {
        throw Exception("The password is not strong enough");
      }
      if (e.code == "invalid-email") {
        throw Exception("The email address is not valid");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signIn({required String email, required String passwd}) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: passwd);
      await UserSharedPreferences.setUserUID(user.user!.uid);
    } on FirebaseAuthException catch (e) {
      await locator
          .get<AnaliticsService>()
          .logAuthError(authType: "Sign in", error: e.code);
      switch (e.code) {
        case "user-not-found":
          throw Exception("There is no user corresponding to the given email");
        case "wrong-password":
          throw Exception("the password is invalid");
        case "user-disabled":
          throw Exception("the user has been disabled");
        default:
          throw Exception(e.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await UserSharedPreferences.clear();
  }

  @override
  Future<void> resetPasswd({required String email}) async {
    try {
      _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      await locator
          .get<AnaliticsService>()
          .logAuthError(authType: "Reset password", error: e.code);
      if (e.code == "auth/invalid-email") {
        throw Exception("The email address is not valid");
      }
      if (e.code == "auth/user-not-found") {
        throw Exception("There is no user corresponding to the email address");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> checkUser() async {
    final firebaseUID = _firebaseAuth.currentUser?.uid;
    if (firebaseUID != null) {
      return firebaseUID == UserSharedPreferences.getUserUID();
    }
    return false;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/repository/user_repository/user_repository.dart';

import '../../../models/user_model.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> getUser() async {
    var firebaseUser = _firebaseAuth.currentUser;
    return UserModel(
        uid: firebaseUser?.uid,
        displayName: firebaseUser?.displayName,
        avatarUrl: null);
  }

  Future<void> signUp({required String email, required String passwd}) async {
    try {
      final UserCredential user = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: passwd);
      await locator
          .get<UserRepository>()
          .initUserDocuments(user.user!.uid, email);
    } on FirebaseAuthException catch (e) {
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

  Future<void> signIn({required String email, required String passwd}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: passwd);
    } on FirebaseAuthException catch (e) {
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

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> resetPasswd({required String email}) async {
    try {
      _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
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
}

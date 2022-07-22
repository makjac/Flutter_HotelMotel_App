import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String passwd}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: passwd);
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
      if (e.code == "user-not-found") {
        throw Exception("There is no user corresponding to the given email");
      }
      if (e.code == "wrong-password") {
        throw Exception("the password is invalid");
      }
      if (e.code == "user-disabled") {
        throw Exception("the user has been disabled");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signInUsingGoogle() async {
    //TODO
  }

  Future<void> signOut() async {
    try {
      _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String passwd}) async {}

  Future<void> signIn({required String email, required String passwd}) async {}

  Future<void> signInUsingGoogle() async {}

  Future<void> signOut() async {}
}

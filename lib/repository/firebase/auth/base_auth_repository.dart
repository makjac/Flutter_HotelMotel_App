import 'package:hotel_motel/data/models/user_model.dart';

abstract class BaseAuthRepository {
  Future<UserModel> getUser();

  Future<void> signUp({required String email, required String passwd});

  Future<void> signIn({required String email, required String passwd});

  Future<void> signOut();

  Future<void> resetPasswd({required String email});
}

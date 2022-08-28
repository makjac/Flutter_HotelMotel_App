import 'dart:io';

import 'package:hotel_motel/data/models/user_model.dart';
import 'package:hotel_motel/data/repository/fb_auth_repository.dart';
import 'package:hotel_motel/data/repository/fb_storage_repository.dart';
import 'package:hotel_motel/locator.dart';

class UserController {
  late UserModel _currentUser;
  final AuthRepository _authRepo = locator.get<AuthRepository>();
  final StorageRepository _storageRepo = locator.get<StorageRepository>();
  late Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel?> initUser() async {
    _currentUser = await _authRepo.getUser();
    getUserProfileImgUrl().then((value) => _currentUser.displayName);
    return _currentUser;
  }

  Future<void> uploadUserProfileImage(File file) async {
    try {
      await _storageRepo.uploadProfileFile(file, _currentUser.uid);
      _storageRepo.getProfulrImgUrl(_currentUser.uid).then(
        (value) {
          _currentUser.avatarUrl = value;
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getUserProfileImgUrl() {
    return _storageRepo.getProfulrImgUrl(_currentUser.uid);
  }

  Future<void> signInUser(
      {required String email, required String passwd}) async {
    try {
      await _authRepo.signIn(email: email, passwd: passwd);
      initUser();
      _storageRepo.getProfulrImgUrl(_currentUser.uid).then(
        (value) {
          _currentUser.avatarUrl = value;
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signUpUser(
      {required String email, required String passwd}) async {
    try {
      _authRepo.signUp(email: email, passwd: passwd);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logoutUser() async {
    try {
      _authRepo.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> resetUserPassword({required String email}) async {
    try {
      _authRepo.resetPasswd(email: email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  UserModel? get currentUser => _currentUser;
}

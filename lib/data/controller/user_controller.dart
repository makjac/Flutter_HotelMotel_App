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
    await _storageRepo.uploadProfileFile(file, _currentUser.uid!);
  }

  Future<String> getUserProfileImgUrl() {
    return _storageRepo.getProfulrImgUrl(_currentUser.uid!);
  }

  UserModel? get currentUser => _currentUser;
}

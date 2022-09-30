import 'dart:io';

import 'package:hotel_motel/data/controller/user/base_user_controller.dart';
import 'package:hotel_motel/data/models/user_model.dart';
import 'package:hotel_motel/data/repository/firebase/analitic/analitics_repository.dart';
import 'package:hotel_motel/data/repository/firebase/auth/auth_repository.dart';
import 'package:hotel_motel/data/repository/firebase/storage/storage_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/user_repository/user_repository.dart';
import 'package:hotel_motel/locator.dart';

class UserController extends BaseUserController {
  late UserModel _currentUser;
  final AuthRepository _authRepo = locator.get<AuthRepository>();
  final StorageRepository _storageRepo = locator.get<StorageRepository>();
  final AnalyticsRepository _analiticsRepo = locator.get<AnalyticsRepository>();
  final UserRepository _userRepository = UserRepository();
  late Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel?> initUser() async {
    _currentUser = await _authRepo.getUser();
    getUserProfileImgUrl().then((value) => _currentUser.displayName);
    return _currentUser;
  }

  Future<String?> uploadUserProfileImage(File file) async {
    try {
      await _storageRepo.uploadProfileFile(file, _currentUser.uid);
      _storageRepo.getProfulrImgUrl(_currentUser.uid).then(
        (value) {
          _currentUser.avatarUrl = value;
        },
      );
      return _currentUser.avatarUrl;
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
      await initUser();
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
      await _authRepo.signUp(email: email, passwd: passwd);
      await _analiticsRepo.loginLog("Email");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logoutUser() async {
    try {
      await _authRepo.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> resetUserPassword({required String email}) async {
    try {
      await _authRepo.resetPasswd(email: email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  UserModel? get currentUser => _currentUser;

  String? get currentUserUid => _currentUser.uid;

  @override
  Future<bool> addFavoriteHotel(String hotelId) async {
    try {
      await _userRepository.addFavoriteHotel(_currentUser.uid!, hotelId);
      return true;
    } catch (error) {
      return false;
    }
  }
}

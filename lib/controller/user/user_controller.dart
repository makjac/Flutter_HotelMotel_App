import 'dart:io';

import 'package:hotel_motel/controller/user/base_user_controller.dart';
import 'package:hotel_motel/data/models/user_model.dart';
import 'package:hotel_motel/repository/firebase/auth/auth_repository.dart';
import 'package:hotel_motel/repository/firebase/storage/storage_repository.dart';
import 'package:hotel_motel/repository/model_repositores/user_repository/user_repository.dart';
import 'package:hotel_motel/locator.dart';

import '../../service/analitics_service/analitics_service.dart';

class UserController extends BaseUserController {
  late UserModel _currentUser;
  final AuthRepository _authRepo = locator.get<AuthRepository>();
  final StorageRepository _storageRepo = locator.get<StorageRepository>();
  final UserRepository _userRepository = UserRepository();
  final AnaliticsService _analiticsService = locator<AnaliticsService>();
  late Future init;

  UserController() {
    //init = initUser();
  }

  Future<UserModel?> initUser() async {
    _currentUser = await _authRepo.getUser();
    getUserProfileImgUrl().then((value) => _currentUser.displayName);
    _currentUser.favorite =
        await _userRepository.getUserFavoriteHotels(_currentUser.uid!);
    print(_currentUser.favorite);
    return _currentUser;
  }

  Future<String?> uploadUserProfileImage(File file) async {
    await _storageRepo.uploadProfileFile(file, _currentUser.uid);
    await _storageRepo.getProfulrImgUrl(_currentUser.uid).then(
      (value) {
        _currentUser.avatarUrl = value;
      },
    );
    return _currentUser.avatarUrl;
  }

  Future<String> getUserProfileImgUrl() {
    return _storageRepo.getProfulrImgUrl(_currentUser.uid);
  }

  Future<void> signInUser(
      {required String email, required String passwd}) async {
    await _authRepo.signIn(email: email, passwd: passwd);
    await initUser();
    await _analiticsService.setUserProporties(userId: _currentUser.uid!);
    await _analiticsService.LoginLog();
    _storageRepo.getProfulrImgUrl(_currentUser.uid).then(
      (value) {
        _currentUser.avatarUrl = value;
      },
    );
  }

  Future<void> signUpUser(
      {required String email, required String passwd}) async {
    await _authRepo.signUp(email: email, passwd: passwd);
    await _analiticsService.LogSignUp();
  }

  Future<void> logoutUser() async {
    await _authRepo.signOut();
  }

  Future<void> resetUserPassword({required String email}) async {
    await _authRepo.resetPasswd(email: email);
  }

  UserModel? get currentUser => _currentUser;

  String? get currentUserUid => _currentUser.uid;

  @override
  Future<bool> addFavoriteHotel(String hotelId) async {
    try {
      return await _userRepository
          .addFavoriteHotel(_currentUser.uid!, hotelId)
          .whenComplete(
              () => _currentUser.favorite?.favoriteHotels?.add(hotelId));
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> removeFavoriteHotel(String hotelID) async {
    try {
      return await _userRepository
          .removeFavoriteHotel(_currentUser.uid!, hotelID)
          .whenComplete(
              () => _currentUser.favorite?.favoriteHotels?.remove(hotelID));
    } catch (error) {
      return false;
    }
  }

  @override
  bool isHotelUserFavorite(String hotelID) {
    if (_currentUser.favorite != null) {
      return _currentUser.favorite!.favoriteHotels!.contains(hotelID);
    }
    return false;
  }
}

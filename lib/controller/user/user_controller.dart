import 'dart:io';

import 'package:hotel_motel/controller/user/base_user_controller.dart';
import 'package:hotel_motel/repository/user_repository/user_repository.dart';
import 'package:hotel_motel/locator.dart';

import '../../models/user_model.dart';
import '../../service/analitics_service/analitics_service.dart';
import '../../service/auth/auth_service.dart';
import '../../service/storage/storage_service.dart';

class UserController extends BaseUserController {
  late UserModel _currentUser;
  final AuthService _authService = locator.get<AuthService>();
  final StorageService _storageService = locator.get<StorageService>();
  final UserRepository _userRepository = UserRepository();
  final AnaliticsService _analiticsService = locator<AnaliticsService>();
  late Future init;

  UserController() {
    //init = initUser();
  }

  Future<UserModel?> initUser() async {
    _currentUser = await _authService.getUser();
    await getUserProfileImgUrl().then((value) => _currentUser.displayName);
    _currentUser.favorite =
        await _userRepository.getUserFavoriteHotels(_currentUser.uid!);
    return _currentUser;
  }

  Future<String?> uploadUserProfileImage(File file) async {
    await _storageService.uploadProfileFile(file, _currentUser.uid);
    await _storageService.getProfUlrImgUrl(_currentUser.uid).then(
      (value) {
        _currentUser.avatarUrl = value;
      },
    );
    return _currentUser.avatarUrl;
  }

  @override
  Future<void> deleteUserProfileImage() async {
    await _storageService
        .deleteProfulrImgUrl(_currentUser.uid)
        .then((value) => _currentUser.avatarUrl = "");
  }

  Future<String> getUserProfileImgUrl() {
    return _storageService.getProfUlrImgUrl(_currentUser.uid);
  }

  Future<void> signInUser(
      {required String email, required String passwd}) async {
    await _authService.signIn(email: email, passwd: passwd);
    await initUser();
    await _analiticsService.setUserProporties(userId: _currentUser.uid!);
    await _analiticsService.LoginLog();
    _storageService.getProfUlrImgUrl(_currentUser.uid).then(
      (value) {
        _currentUser.avatarUrl = value;
      },
    );
  }

  Future<void> signUpUser(
      {required String email, required String passwd}) async {
    await _authService.signUp(email: email, passwd: passwd);
    await _analiticsService.LogSignUp();
  }

  Future<void> logoutUser() async {
    await _authService.signOut();
  }

  Future<void> resetUserPassword({required String email}) async {
    await _authService.resetPasswd(email: email);
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

  @override
  Future<bool> isUserLoggedIn() async {
    if (await _authService.checkUser()) {
      await initUser();
      await _analiticsService.setUserProporties(userId: _currentUser.uid!);
      _storageService.getProfUlrImgUrl(_currentUser.uid).then(
        (value) {
          _currentUser.avatarUrl = value;
        },
      );
      return true;
    }
    return false;
  }
}

import 'dart:io';

import '../../models/user_model.dart';

abstract class BaseUserController {
  Future<UserModel?> initUser();

  Future<String?> uploadUserProfileImage(File file);

  Future<String> getUserProfileImgUrl();

  Future<void> signInUser({required String email, required String passwd});

  Future<void> signUpUser({required String email, required String passwd});

  Future<void> logoutUser();

  Future<void> resetUserPassword({required String email});

  Future<bool> addFavoriteHotel(String hotelId);

  Future<bool> removeFavoriteHotel(String hotelID);

  bool isHotelUserFavorite(String hotelID);

  Future<bool> isUserLoggedIn();

  UserModel? get currentUser;

  String? get currentUserUid;
}

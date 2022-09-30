import 'package:hotel_motel/data/models/user_model.dart';

abstract class BaseUserRepository {
  Stream<UserModel> getUserDetails(String uid);
  Future<void> addFavoriteHotel(String userUid, String hotelId);
}

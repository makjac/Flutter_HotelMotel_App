import '../../../models/favorite_model.dart';
import '../../../models/user_model.dart';

abstract class BaseUserRepository {
  Stream<UserModel> getUserDetails(String uid);

  Future<bool> addFavoriteHotel(String userUid, String hotelId);

  Future<bool> removeFavoriteHotel(String userUid, String hotelID);

  Future<Favorite> getUserFavoriteHotels(String userUid);
}

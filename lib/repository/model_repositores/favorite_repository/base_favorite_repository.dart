import '../../../models/favorite_model.dart';

abstract class BaseFavoriteRepository {
  Stream<Favorite> getUserFavorite(String uid);
}

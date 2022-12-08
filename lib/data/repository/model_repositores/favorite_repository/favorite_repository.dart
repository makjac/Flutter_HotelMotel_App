import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/models/favorite_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/favorite_repository/base_favorite_repository.dart';

class FavoriteRepository extends BaseFavoriteRepository {
  FirebaseFirestore _firestore;

  FavoriteRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<Favorite> getUserFavorite(String uid) {
    final favoriteRef = _firestore
        .collection('user')
        .doc(uid)
        .collection('favorite')
        .doc('favorite');
    return favoriteRef.snapshots().map((favoriteDoc) {
      return Favorite.fromSnapshot(favoriteDoc);
    });
  }
}

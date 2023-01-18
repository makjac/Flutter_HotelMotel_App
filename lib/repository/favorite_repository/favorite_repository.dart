import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/repository/favorite_repository/base_favorite_repository.dart';

import '../../../models/favorite_model.dart';

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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/models/favorite_model.dart';
import 'package:hotel_motel/data/models/user_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/favorite_repository/favorite_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/user_repository/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firestore;

  UserRepository(
      {FirebaseFirestore? firebaseFirestore,
      FavoriteRepository? favoriteRepository})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<UserModel> getUserDetails(String uid) {
    final userRef = _firestore.collection('user').doc(uid);
    return userRef
        .snapshots()
        .map((userDoc) => UserModel.fromSnapshot(userDoc));
  }

  @override
  Future<bool> addFavoriteHotel(String userUid, String hotelId) async {
    try {
      final favoriteRef = _firestore
          .collection('user')
          .doc(userUid)
          .collection('favorite')
          .doc('favorite');
      await favoriteRef.update(
        {
          "favorite_hotels": FieldValue.arrayUnion([hotelId]),
        },
      );
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> removeFavoriteHotel(String userUid, String hotelID) async {
    try {
      final favoriteRef = _firestore
          .collection('user')
          .doc(userUid)
          .collection('favorite')
          .doc('favorite');
      await favoriteRef.update(
        {
          "favorite_hotels": FieldValue.arrayRemove([hotelID]),
        },
      );
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<Favorite> getUserFavoriteHotels(String userUid) async {
    var snap = await _firestore
        .collection('user')
        .doc(userUid)
        .collection('favorite')
        .doc('favorite')
        .get();
    return Favorite.fromSnapshot(snap);
  }
}

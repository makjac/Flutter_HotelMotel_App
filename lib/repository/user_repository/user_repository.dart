import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/repository/favorite_repository/favorite_repository.dart';
import 'package:hotel_motel/repository/user_repository/base_user_repository.dart';

import '../../models/favorite_model.dart';
import '../../models/user_model.dart';

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

  @override
  Future<void> initUserDocuments(String userUid, String email) async {
    var userRef = _firestore.collection('user');
    var favoriteRef =
        userRef.doc(userUid).collection('favorite').doc('favorite');
    var detailsRef = userRef.doc(userUid).collection('details').doc('details');

    await userRef.doc(userUid).set({
      'anonim': false,
      'username': "",
    }).then((value) async {
      await favoriteRef.set({
        'favorite_hotels': [],
        'favorite_location': [],
      });
      await detailsRef.set({
        'building_number': "",
        'city': "",
        'email': email,
        'local_number': "",
        'name': "",
        'phone_number': "",
        'street': "",
        'surname': "",
        'zipcode': "",
      });
    });
  }
}

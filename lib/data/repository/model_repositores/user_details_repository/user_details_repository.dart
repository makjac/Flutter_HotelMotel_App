// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/controller/user/user_controller.dart';

import 'package:hotel_motel/data/models/user_details.dart';
import 'package:hotel_motel/data/repository/model_repositores/user_details_repository/base_user_details_repository.dart';
import 'package:hotel_motel/locator.dart';

class UserDetailsRepository extends BaseUserDetailsRepository {
  final FirebaseFirestore _firestore;

  UserDetailsRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<UserDetails> getUserDetails(String userUid) {
    try {
      var usrDetailsRef = _firestore
          .collection('user')
          .doc(userUid)
          .collection('details')
          .doc('details');
      return usrDetailsRef
          .snapshots()
          .map((detailsDoc) => UserDetails.fromSnapshot(detailsDoc));
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<bool> updateUserDetails(
      String userUid, UserDetails userDetails) async {
    try {
      var usrDetailsRef = _firestore
          .collection('user')
          .doc(userUid)
          .collection('details')
          .doc('details');
      usrDetailsRef.update(userDetails.toMap());
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }
}

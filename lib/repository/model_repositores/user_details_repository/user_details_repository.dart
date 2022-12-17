import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hotel_motel/repository/model_repositores/user_details_repository/base_user_details_repository.dart';

import '../../../models/user_details.dart';

class UserDetailsRepository extends BaseUserDetailsRepository {
  final FirebaseFirestore _firestore;

  UserDetailsRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<UserDetails> getUserDetails(String userUid) {
    var usrDetailsRef = _firestore
        .collection('user')
        .doc(userUid)
        .collection('details')
        .doc('details');
    return usrDetailsRef
        .snapshots()
        .map((detailsDoc) => UserDetails.fromSnapshot(detailsDoc));
  }

  @override
  Future<void> updateUserDetails(
      String userUid, UserDetails userDetails) async {
    var usrDetailsRef = _firestore
        .collection('user')
        .doc(userUid)
        .collection('details')
        .doc('details');
    usrDetailsRef.update(userDetails.toMap());
  }
}

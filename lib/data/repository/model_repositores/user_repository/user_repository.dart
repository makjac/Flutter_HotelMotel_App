import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/models/user_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/user_repository/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<UserModel> getUserDetails(String uid) {
    final userRef = _firestore.collection('user').doc(uid);
    return userRef
        .snapshots()
        .map((userDoc) => UserModel.fromSnapshot(userDoc));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/repository/model_repositores/category/base_category_repository.dart';

import '../../../models/category_model.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firestore.collection('categoryies').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}

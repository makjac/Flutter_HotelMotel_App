import 'package:hotel_motel/data/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}

import 'package:hive/hive.dart';
import 'package:hotel_motel/data/hive_models/search_model.dart';

class Boxes {
  static Box<Search> getSearch() => Hive.box<Search>('search');
}

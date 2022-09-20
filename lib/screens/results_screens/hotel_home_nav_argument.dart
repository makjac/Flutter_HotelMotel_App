import 'package:hotel_motel/data/models/search_cryteria.dart';

class hotelPageArguments {
  final SearchCryteria? cryteria;
  final String hotelID;

  hotelPageArguments({
    this.cryteria,
    required this.hotelID,
  });
}

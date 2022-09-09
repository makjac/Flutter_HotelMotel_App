import 'package:hotel_motel/data/models/hotel_model.dart';

abstract class BaseHotelRepository {
  Stream<List<Hotel>> getAllHotels();

  Stream<List<Hotel>> getHotelsFromLocation(String location);
}

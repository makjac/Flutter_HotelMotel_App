import '../../../models/hotel_model.dart';

abstract class BaseHotelRepository {
  Stream<List<Hotel>> getAllHotels();

  Stream<Hotel> getHotel(String hotelID);

  Stream<List<Hotel>> getHotelsFromLocation(String location);

  Stream<List<Hotel>> getAllRecomendedHotels(int limit);
}

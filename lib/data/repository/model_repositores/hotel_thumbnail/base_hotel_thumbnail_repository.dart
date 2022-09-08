import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';

abstract class BaseHotelThumbnailRepository {
  Stream<List<HotelThumbnailModel>> getAllThumbnails();

  Stream<List<HotelThumbnailModel>?> getAllThumbnailsFromLocation(
      String location);

  Stream<List<HotelThumbnailModel>?> getThubnailsWithCaegory(
      String location, int rooms, int people);
}

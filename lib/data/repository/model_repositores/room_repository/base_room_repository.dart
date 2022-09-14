import 'package:hotel_motel/data/models/room_model.dart';

abstract class BaseRoomRepository {
  Stream<List<Room>> getHotelRoom(String hotelID);

  Stream<List<Room>> getHotelRooms(String hotelID);
}

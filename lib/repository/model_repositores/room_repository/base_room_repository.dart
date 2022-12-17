import '../../../models/room_model.dart';

abstract class BaseRoomRepository {
  Stream<List<Room>> getHotelRoom(String hotelID);

  Stream<List<Room>> getHotelRooms(String hotelID);

  Stream<Room> getRoom(String hotelID, String roomID);
}

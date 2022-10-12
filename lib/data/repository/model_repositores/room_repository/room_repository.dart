import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/models/room_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/base_room_repository.dart';

class RoomRepository extends BaseRoomRepository {
  final FirebaseFirestore _firestore;

  RoomRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  //todo: remove list
  @override
  Stream<List<Room>> getHotelRoom(String hotelID) {
    final roomRef = _firestore
        .collection('hotel')
        .doc(hotelID)
        .collection('room')
        .orderBy('price')
        .limit(1);
    return roomRef.snapshots().map((rooms) {
      return rooms.docs.map((roomDoc) => Room.fromSnapshot(roomDoc)).toList();
    });
  }

  @override
  Stream<List<Room>> getHotelRooms(String hotelID) {
    final roomRef =
        _firestore.collection('hotel').doc(hotelID).collection('room');
    return roomRef.snapshots().map((rooms) {
      return rooms.docs.map((roomDoc) => Room.fromSnapshot(roomDoc)).toList();
    });
  }

  @override
  Stream<Room> getRoom(String hotelID, String roomID) {
    final RoomRef = _firestore
        .collection('hotel')
        .doc(hotelID)
        .collection('room')
        .doc(roomID);
    return RoomRef.snapshots().map((roomDoc) => Room.fromSnapshot(roomDoc));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/base_hotel_repository.dart';

class HotelRepository extends BaseHotelRepository {
  final FirebaseFirestore _firestore;

  HotelRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Hotel>> getAllHotels() {
    final hotelRef = _firestore.collection('hotel');
    return hotelRef.snapshots().map((hotels) {
      return hotels.docs
          .map((hotelDoc) => Hotel.fromSnapshot(hotelDoc))
          .toList();
    });
  }

  @override
  Stream<List<Hotel>> getHotelsFromLocation(String location) {
    final hotelRef =
        _firestore.collection('hotel').where('city', isEqualTo: location);
    return hotelRef.snapshots().map((hotels) {
      return hotels.docs
          .map((hotelDoc) => Hotel.fromSnapshot(hotelDoc))
          .toList();
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_thumbnail/base_hotel_thumbnail_repository.dart';

class HotelThumbnailRepository extends BaseHotelThumbnailRepository {
  final FirebaseFirestore _firestore;

  HotelThumbnailRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<HotelThumbnailModel>> getAllThumbnails() async {
    try {
      List<HotelThumbnailModel> response = [];

      final hotelRef = await _firestore.collection("hotel");

      final hotelSnapshot = await hotelRef.snapshots();

      await hotelSnapshot.map((hotels) async {
        return await hotels.docs.map((hotelDoc) async {
          final roomRef = hotelRef
              .doc(hotelDoc.id)
              .collection("room")
              .orderBy('price')
              .limit(1);
          return await roomRef.snapshots().map((rooms) async {
            return await rooms.docs.map((roomDoc) async {
              response.add(HotelThumbnailModel.fromSnapshot(hotelDoc, roomDoc));
            });
          });
        });
      });

      return await response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<List<HotelThumbnailModel>?> getAllThumbnailsFromLocation(
      String location) {
    // TODO: implement getAllThumbnailsFromLocation
    throw UnimplementedError();
  }

  @override
  Stream<List<HotelThumbnailModel>?> getThubnailsWithCaegory(
      String location, int rooms, int people) {
    // TODO: implement getThubnailsWithCaegory
    throw UnimplementedError();
  }
}

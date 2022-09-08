import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_thumbnail/base_hotel_thumbnail_repository.dart';

class HotelThumbnailRepository extends BaseHotelThumbnailRepository {
  final FirebaseFirestore _firestore;

  HotelThumbnailRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<HotelThumbnailModel>> getAllThumbnails() async* {
    try {
      List<HotelThumbnailModel> response = [];

      final hotelRef = _firestore.collection("hotel");

      final hotelSnapshot = await hotelRef.snapshots();

       yield* hotelSnapshot.map((hotels) {
        for(var hotelDoc in hotels.docs){
        //hotels.docs.forEach((hotelDoc) {
          final roomRef = hotelRef
              .doc(hotelDoc.id)
              .collection("room")
              .orderBy('price')
              .limit(1);
          return roomRef.snapshots().map((rooms) {
            for(var roomDoc in rooms.docs){
            //rooms.docs.forEach((roomDoc) {
              response.add(HotelThumbnailModel.fromSnapshot(hotelDoc, roomDoc))
              return response;
            }});
          }}).toList();
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

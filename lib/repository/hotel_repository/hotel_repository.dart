import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/models/review_model.dart';
import 'package:hotel_motel/repository/hotel_repository/base_hotel_repository.dart';

import '../../../models/hotel_model.dart';

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

  @override
  Stream<List<Hotel>> getAllRecomendedHotels(int limit) {
    final hotelRef = _firestore
        .collection('hotel')
        .where('isRecomended', isEqualTo: true)
        .limit(limit);
    return hotelRef.snapshots().map((hotels) {
      return hotels.docs
          .map((hotelDoc) => Hotel.fromSnapshot(hotelDoc))
          .toList();
    });
  }

  @override
  Stream<Hotel> getHotel(String hotelID) {
    final hotelRef = _firestore.collection('hotel').doc(hotelID);
    return hotelRef.snapshots().map((hotel) {
      return Hotel.fromSnapshot(hotel);
    });
  }

  @override
  Future<void> updateHotelScores(ReviewModel review) async {
    final hotelRef = _firestore.collection('hotel').doc(review.hotelID);
    await hotelRef.snapshots().first.then((hotel) async {
      Hotel hotelDoc = Hotel.fromSnapshot(hotel);
      num reviews = hotelDoc.score['opinions'];
      await hotelRef.update({
        "rating": ((hotelDoc.rating * reviews) + review.details.total) /
            (reviews + 1),
        "score": {
          "comfort":
              ((hotelDoc.score['comfort'] * reviews) + review.details.comfort) /
                  (reviews + 1),
          "facilities": ((hotelDoc.score['facilities'] * reviews) +
                  review.details.amenities) /
              (reviews + 1),
          "location": ((hotelDoc.score['location'] * reviews) +
                  review.details.location) /
              (reviews + 1),
          "opinions": reviews + 1,
          "price":
              ((hotelDoc.score['price'] * reviews) + review.details.price) /
                  (reviews + 1),
          "purity":
              ((hotelDoc.score['purity'] * reviews) + review.details.purity) /
                  (reviews + 1),
          "staff":
              ((hotelDoc.score['staff'] * reviews) + review.details.staff) /
                  (reviews + 1),
        }
      });
    });
  }
}

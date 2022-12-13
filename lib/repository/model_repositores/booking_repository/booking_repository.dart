// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hotel_motel/data/models/booking_model.dart';
import 'package:hotel_motel/repository/model_repositores/booking_repository/base_booking_repository.dart';

class BookingRepository extends BaseBookingRepository {
  final FirebaseFirestore _firebaseFirestore;

  BookingRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Booking>> getUserBookings(String userUid) {
    final bookingRef = _firebaseFirestore
        .collection('booking')
        .where('user_uid', isEqualTo: userUid);

    return bookingRef.snapshots().map((bookings) {
      return bookings.docs
          .map((bookingDoc) => Booking.fromSnapshot(bookingDoc))
          .toList();
    });
  }

  @override
  Future<void> updateReviewStatus(String bookingID, bool status) async {
    final bookingRef = _firebaseFirestore.collection('booking').doc(bookingID);
    await bookingRef.update({'opinion': 'added'});
  }

  @override
  Future<void> createBooking(Booking booking) async {
    final bookingRef = _firebaseFirestore.collection('booking');
    await bookingRef.add(booking.toMapCreation());
  }
}

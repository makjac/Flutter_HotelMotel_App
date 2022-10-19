import 'package:hotel_motel/data/models/booking_model.dart';

abstract class BaseBookingRepository {
  Stream<List<Booking>> getUserBookings(String userUid);

  Future<void> updateReviewStatus(String bookingId, bool status);
}

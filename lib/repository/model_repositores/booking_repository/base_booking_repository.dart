import '../../../models/booking_model.dart';

abstract class BaseBookingRepository {
  Stream<List<Booking>> getUserBookings(String userUid);

  Future<void> updateReviewStatus(String bookingId, bool status);

  Future<void> createBooking(Booking booking);
}

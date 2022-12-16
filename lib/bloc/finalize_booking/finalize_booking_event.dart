// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'finalize_booking_bloc.dart';

abstract class FinalizeBookingEvent extends Equatable {
  const FinalizeBookingEvent();

  @override
  List<Object> get props => [];
}

class LoadDetails extends FinalizeBookingEvent {
  final String userUid;

  LoadDetails({
    required this.userUid,
  });

  @override
  List<Object> get props => [this.userUid];
}

class UpdateUserDetails extends FinalizeBookingEvent {
  final String userUid;
  final UserDetails userDetails;

  UpdateUserDetails({
    required this.userUid,
    required this.userDetails,
  });

  @override
  List<Object> get props => [
        this.userUid,
        this.userDetails,
      ];
}

class CreateBooking extends FinalizeBookingEvent {
  final Booking booking;

  CreateBooking({
    required this.booking,
  });

  @override
  List<Object> get props => [booking];
}

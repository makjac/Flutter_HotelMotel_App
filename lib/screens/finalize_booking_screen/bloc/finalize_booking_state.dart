// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'finalize_booking_bloc.dart';

abstract class FinalizeBookingState extends Equatable {
  const FinalizeBookingState();

  @override
  List<Object> get props => [];
}

class FinalizeBookingInitial extends FinalizeBookingState {}

class LoadingDetails extends FinalizeBookingState {}

class UserDetailsLoaded extends FinalizeBookingState {
  final UserDetails userDetails;

  UserDetailsLoaded({
    required this.userDetails,
  });

  @override
  List<Object> get props => [this.userDetails];
}

class UpdatingUserDetails extends FinalizeBookingState {}

class UserDetailsUpdated extends FinalizeBookingState {}

class CreatingBooking extends FinalizeBookingState {}

class BookingCreated extends FinalizeBookingState {}

class ErrorFinalizeBooking extends FinalizeBookingState {
  final String error;

  ErrorFinalizeBooking({
    required this.error,
  });

  @override
  List<Object> get props => [this.error];
}

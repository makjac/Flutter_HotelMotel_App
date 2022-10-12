// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bookings_bloc.dart';

abstract class BookingsState extends Equatable {
  const BookingsState();

  @override
  List<Object> get props => [];
}

class BookingsInitial extends BookingsState {}

class LoadingBooking extends BookingsState {}

class LoadingMoreBookings extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<BookingThumbnailModel> thumbnails;

  BookingsLoaded(this.thumbnails);

  @override
  List<Object> get props => [thumbnails];
}

class EmptyBookings extends BookingsState {}

class BookingError extends BookingsState {
  final String error;

  BookingError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/data/controller/user/user_controller.dart';
import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/booking_repository/booking_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';
import 'package:hotel_motel/locator.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final BookingRepository _bookingRepository;
  final HotelRepository _hotelRepository;
  final RoomRepository _roomRepository;
  List<BookingThumbnailModel> thumbnails = [];

  BookingsBloc({
    BookingRepository? bookingRepository,
    HotelRepository? hotelRepository,
    RoomRepository? roomRepository,
  })  : _bookingRepository = bookingRepository ?? BookingRepository(),
        _hotelRepository = hotelRepository ?? HotelRepository(),
        _roomRepository = roomRepository ?? RoomRepository(),
        super(BookingsInitial()) {
    on<LoadBookings>(_loadBookings);
  }

  FutureOr<void> _loadBookings(
      LoadBookings event, Emitter<BookingsState> emit) async {
    try {
      emit(LoadingBooking());
      thumbnails = [];
      var bookingStream = await _bookingRepository
          .getUserBookings(locator.get<UserController>().currentUserUid!);
      await bookingStream.listen((bookings) {
        bookings.forEach((booking) async {
          emit(LoadingMoreBookings());
          var hotelStream = await _hotelRepository.getHotel(booking.hotelID);
          await hotelStream.first.then((hotel) async {
            var RoomStream =
                await _roomRepository.getRoom(booking.hotelID, booking.roomID);
            await RoomStream.first.then((room) {
              thumbnails.add(BookingThumbnailModel(
                  booking: booking, hotel: hotel, room: room));
              emit(BookingsLoaded(thumbnails));
            });
          });
        });
      }).asFuture();
    } catch (error) {
      emit(BookingError(error: error.toString()));
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/data/models/room_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';

part 'hotel_page_event.dart';
part 'hotel_page_state.dart';

class HotelPageBloc extends Bloc<HotelPageEvent, HotelPageState> {
  final HotelRepository _hotelRepository;
  final RoomRepository _roomRepository;
  HotelPageBloc(
      {HotelRepository? hotelRepository, RoomRepository? roomRepository})
      : _hotelRepository = hotelRepository ?? HotelRepository(),
        _roomRepository = roomRepository ?? RoomRepository(),
        super(HotelPageInitial()) {
    on<LoadHotelData>(_loadHotel);
  }

  FutureOr<void> _loadHotel(
      LoadHotelData event, Emitter<HotelPageState> emit) async {
    try {
      emit(LoadingHotelData());
      var hotelStr = await _hotelRepository.getHotel(event.hotelID);
      await hotelStr.listen((hotel) async {
        await _roomRepository
            .getHotelRooms(event.hotelID)
            .listen(
                (rooms) => emit(HotelDataLoaded(hotel: hotel, rooms: rooms)))
            .asFuture();
      }).asFuture();
    } catch (error) {
      emit(HotelPageError(error: error.toString()));
    }
  }
}

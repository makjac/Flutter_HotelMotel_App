import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/hotel_thumbnail_model.dart';
import '../../repository/hotel_repository/hotel_repository.dart';
import '../../repository/room_repository/room_repository.dart';

part 'hotel_thumbnail_event.dart';
part 'hotel_thumbnail_state.dart';

class HotelThumbnailBloc
    extends Bloc<HotelThumbnailEvent, HotelThumbnailState> {
  final HotelRepository _hotelRepository;
  final RoomRepository _roomRepository;

  HotelThumbnailBloc(
      {HotelRepository? hotelRepository, RoomRepository? roomRepository})
      : _hotelRepository = hotelRepository ?? HotelRepository(),
        _roomRepository = roomRepository ?? RoomRepository(),
        super(HotelThumbnailInitial()) {
    on<LoadThumbnails>(_loadThumbnails);
    on<UpdateThumbnails>(_updateThumbnails);
  }

  FutureOr<void> _loadThumbnails(
      LoadThumbnails event, Emitter<HotelThumbnailState> emit) async {
    try {
      emit(ThumbnailsLoading());
      List<HotelThumbnailModel> thumbnails = [];
      await _hotelRepository.getAllHotels().forEach((hotels) async {
        hotels.forEach((hotel) async {
          await _roomRepository.getHotelRoom(hotel.hotelID).listen((room) {
            thumbnails.add(HotelThumbnailModel.fromModels(hotel, room.last));
            emit(ThumbnailsLoaded(hotelThumbnails: thumbnails));
          }).asFuture();
        });
      });
    } catch (e) {
      emit(ThumbnailError(error: e.toString()));
    }
  }

  FutureOr<void> _updateThumbnails(
      UpdateThumbnails event, Emitter<HotelThumbnailState> emit) async {
    emit(ThumbnailsLoaded(hotelThumbnails: event.thumbnails));
  }
}

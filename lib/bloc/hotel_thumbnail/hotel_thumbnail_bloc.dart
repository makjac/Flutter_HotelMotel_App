import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';

part 'hotel_thumbnail_event.dart';
part 'hotel_thumbnail_state.dart';

class HotelThumbnailBloc
    extends Bloc<HotelThumbnailEvent, HotelThumbnailState> {
  final HotelRepository _hotelRepository = HotelRepository();
  final RoomRepository _roomRepository = RoomRepository();

  HotelThumbnailBloc() : super(HotelThumbnailInitial()) {
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
            print(thumbnails.last);
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

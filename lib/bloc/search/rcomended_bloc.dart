import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/repository/model_repositores/room_repository/room_repository.dart';

import '../../models/hotel_thumbnail_model.dart';

part 'rcomended_event.dart';
part 'rcomended_state.dart';

class RecomendedBloc extends Bloc<RecomendedEvent, RecomendedState> {
  final HotelRepository _hotelRepository;
  final RoomRepository _roomRepository;
  RecomendedBloc(
      {HotelRepository? hotelRepository, RoomRepository? roomRepository})
      : _hotelRepository = hotelRepository ?? HotelRepository(),
        _roomRepository = roomRepository ?? RoomRepository(),
        super(RcomendedInitial()) {
    on<LoadRecommendation>(_loadRecomended);
  }

  FutureOr<void> _loadRecomended(
      LoadRecommendation event, Emitter<RecomendedState> emit) async {
    try {
      emit(LoadingRecommendation());
      List<HotelThumbnailModel> thumbnails = [];
      var hotelsStream = await _hotelRepository.getAllRecomendedHotels(3);
      await hotelsStream.forEach((hotles) async {
        hotles.forEach((hotel) async {
          emit(LoadingMoreRecommendation());
          var roomsStream = await _roomRepository.getHotelRoom(hotel.hotelID);
          await roomsStream.forEach((rooms) {
            thumbnails.add(HotelThumbnailModel.fromModels(hotel, rooms[0]));
            emit(RecommendationLoaded(thumbnails: thumbnails));
          });
        });
      });
    } catch (error) {
      emit(RecomendedError(error: error.toString()));
    }
  }
}

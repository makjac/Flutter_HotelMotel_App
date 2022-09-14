import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/models/search_cryteria.dart';
import 'package:hotel_motel/data/repository/http/http_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';
import 'package:hotel_motel/utils/date.dart';

part 'result_search_event.dart';
part 'result_search_state.dart';

class ResultSearchBloc extends Bloc<ResultSearchEvent, ResultSearchState> {
  final HttpRepository _httpRepository;
  final HotelRepository _hotelRepository;
  final RoomRepository _roomRepository;
  ResultSearchBloc(
      {HttpRepository? httpRepository,
      HotelRepository? hotelRepository,
      RoomRepository? roomRepository})
      : _httpRepository = httpRepository ?? HttpRepository(),
        _hotelRepository = hotelRepository ?? HotelRepository(),
        _roomRepository = roomRepository ?? RoomRepository(),
        super(ResultSearchInitial()) {
    on<LoadSearchResults>(_loadResults);
    on<UpdateResults>(_updateResults);
  }

  FutureOr<void> _loadResults(
      LoadSearchResults event, Emitter<ResultSearchState> emit) async {
    try {
      emit(LoadingResults());
      List<HotelThumbnailModel> thumbnails = [];
      await _hotelRepository
          .getHotelsFromLocation(event.searchCryteria.location)
          .forEach((hotels) {
        hotels.forEach((hotel) async {
          _roomRepository.getHotelRooms(hotel.hotelID).listen((rooms) {
            rooms.forEach((room) async {
              var colision = await _httpRepository.getBookingColision(
                  room.roomID, event.searchCryteria.timeRange);
              if (room.numberOfRooms > colision) {
                thumbnails.add(HotelThumbnailModel.fromModels(hotel, room));
                emit(ResultsLoaded(thumbnails: thumbnails));
              }
            });
          });
        });
      });
    } catch (error) {
      emit(ResultsError(error: error.toString()));
    }
  }

  FutureOr<void> _updateResults(
      UpdateResults event, Emitter<ResultSearchState> emit) async {
    try {} catch (error) {
      emit(ResultsError(error: error.toString()));
    }
  }
}

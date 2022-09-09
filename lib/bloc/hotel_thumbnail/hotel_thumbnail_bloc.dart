import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/models/room_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_thumbnail/hotel_thumbnail_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';

part 'hotel_thumbnail_event.dart';
part 'hotel_thumbnail_state.dart';

class HotelThumbnailBloc
    extends Bloc<HotelThumbnailEvent, HotelThumbnailState> {
  final HotelThumbnailRepository _hotelThumbnailRepository;
  final HotelRepository _hotelRepository = HotelRepository();
  final RoomRepository _roomRepository = RoomRepository();
  StreamSubscription? _streamSubscription;

  HotelThumbnailBloc(
      {required HotelThumbnailRepository hotelThumbnailRepository})
      : _hotelThumbnailRepository = hotelThumbnailRepository,
        super(HotelThumbnailInitial()) {
    on<LoadThumbnails>(_loadThumbnails);
    on<UpdateThumbnails>(_updateThumbnails);
  }

  FutureOr<void> _loadThumbnails(
      LoadThumbnails event, Emitter<HotelThumbnailState> emit) async {
    try {
      emit(ThumbnailsLoading());
      List<HotelThumbnailModel> thumbnails = [];
      await _hotelRepository.getAllHotels().listen((hotel) async {
        await _roomRepository.getHotelRoom(hotel.last.hotelID).listen((room) {
          thumbnails.add(HotelThumbnailModel.fromModels(hotel.last, room.last));
          emit(ThumbnailsLoaded(hotelThumbnails: thumbnails));
          print(thumbnails.last);
        }).asFuture();
      }).asFuture();
    } catch (e) {
      emit(ThumbnailError(error: e.toString()));
    }
  }

  FutureOr<void> _updateThumbnails(
      UpdateThumbnails event, Emitter<HotelThumbnailState> emit) async {
    emit(ThumbnailsLoaded(hotelThumbnails: event.thumbnails));
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/controller/user/user_controller.dart';
import 'package:hotel_motel/locator.dart';

import '../../models/hotel_thumbnail_model.dart';
import '../../repository/favorite_repository/favorite_repository.dart';
import '../../repository/hotel_repository/hotel_repository.dart';
import '../../repository/room_repository/room_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteRepository _favoriteRepository;
  HotelRepository _hotelRepository;
  RoomRepository _roomRepository;
  UserController _userController = locator.get<UserController>();
  FavoriteBloc({
    FavoriteRepository? favoriteRepository,
    HotelRepository? hotelRepository,
    RoomRepository? roomRepository,
  })  : _favoriteRepository = favoriteRepository ?? FavoriteRepository(),
        _hotelRepository = hotelRepository ?? HotelRepository(),
        _roomRepository = roomRepository ?? RoomRepository(),
        super(FavoriteInitial()) {
    on<LoadHotelsEvt>(_loadHotels);
    on<UpdateHotelsEvt>(_updateHotels);
  }

  FutureOr<void> _loadHotels(
      LoadHotelsEvt event, Emitter<FavoriteState> emit) async {
    try {
      emit(LoadingFavoriteHotels());
      List<HotelThumbnailModel> thumbnails = [];
      await _favoriteRepository
          .getUserFavorite(_userController.currentUserUid!)
          .forEach((favotire) {
        if (favotire.favoriteHotels != []) {
          favotire.favoriteHotels?.forEach((favoriteHotel) async {
            await _hotelRepository
                .getHotel(favoriteHotel)
                .listen((hotel) async {
              _roomRepository.getHotelRoom(hotel.hotelID).listen((room) {
                thumbnails
                    .add(HotelThumbnailModel.fromModels(hotel, room.last));

                emit(FavoriteHotelsLoaded(hotels: thumbnails));
              });
            });
          });
        } else {
          emit(NoFavorites());
        }
      });
    } catch (error) {
      emit(NoFavorites());
    }
  }

  FutureOr<void> _updateHotels(
      UpdateHotelsEvt event, Emitter<FavoriteState> emit) async {}
}

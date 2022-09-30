import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/data/controller/user/user_controller.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/favorite_repository/favorite_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';
import 'package:hotel_motel/locator.dart';

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
        if (favotire.favoriteHotels![0].isNotEmpty) {
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
          emit(FavoriteError(error: "You don't have any favorite hotel"));
        }
      });
    } catch (error) {
      emit(NoFavorites());
    }
  }

  FutureOr<void> _updateHotels(
      UpdateHotelsEvt event, Emitter<FavoriteState> emit) async {}
}

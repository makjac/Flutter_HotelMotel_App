import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/controller/user/user_controller.dart';
import 'package:hotel_motel/locator.dart';

part 'hotel_appbar_event.dart';
part 'hotel_appbar_state.dart';

class HotelAppbarBloc extends Bloc<HotelAppbarEvent, HotelAppbarState> {
  final UserController _userController;
  HotelAppbarBloc()
      : _userController = locator.get<UserController>(),
        super(HotelAppbarInitial()) {
    on<AddFavoriteHotel>(_addHotelToFavorite);
    on<RemoveFavoriteHotel>(_removeFavoriteHotel);
  }

  FutureOr<void> _addHotelToFavorite(
      AddFavoriteHotel event, Emitter<HotelAppbarState> emit) async {
    try {
      var result = _userController.addFavoriteHotel(event.hotelID);

      await result.then((value) {
        if (value) {
          emit(AddedFavorite());
        } else {
          emit(ErrorHotelAppbar(error: "not added"));
        }
      });
    } catch (error) {
      emit(ErrorHotelAppbar(error: error.toString()));
    }
  }

  FutureOr<void> _removeFavoriteHotel(
      RemoveFavoriteHotel event, Emitter<HotelAppbarState> emit) async {
    try {
      var result = _userController.removeFavoriteHotel(event.hotelID);

      await result.then((value) {
        if (value) {
          emit(RemovedFavorite());
        } else {
          emit(ErrorHotelAppbar(error: "not removed"));
        }
      });
    } catch (error) {
      emit(ErrorHotelAppbar(error: error.toString()));
    }
  }
}

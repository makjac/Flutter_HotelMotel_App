// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hotel_appbar_bloc.dart';

abstract class HotelAppbarEvent extends Equatable {
  const HotelAppbarEvent();

  @override
  List<Object> get props => [];
}

class AddFavoriteHotel extends HotelAppbarEvent {
  final String hotelID;
  AddFavoriteHotel({
    required this.hotelID,
  });

  @override
  List<Object> get props => [this.hotelID];
}

class RemoveFavoriteHotel extends HotelAppbarEvent {
  final String hotelID;
  RemoveFavoriteHotel({
    required this.hotelID,
  });

  @override
  List<Object> get props => [this.hotelID];
}

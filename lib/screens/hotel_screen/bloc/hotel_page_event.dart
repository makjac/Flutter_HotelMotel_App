part of 'hotel_page_bloc.dart';

abstract class HotelPageEvent extends Equatable {
  const HotelPageEvent();

  @override
  List<Object> get props => [];
}

class LoadHotelData extends HotelPageEvent {
  final String hotelID;

  LoadHotelData({required this.hotelID});

  @override
  List<Object> get props => [this.hotelID];
}

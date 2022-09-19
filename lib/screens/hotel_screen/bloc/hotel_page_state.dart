part of 'hotel_page_bloc.dart';

abstract class HotelPageState extends Equatable {
  const HotelPageState();

  @override
  List<Object> get props => [];
}

class HotelPageInitial extends HotelPageState {}

class LoadingHotelData extends HotelPageState {}

class HotelDataLoaded extends HotelPageState {
  final Hotel hotel;
  final List<Room> rooms;

  HotelDataLoaded({
    required this.hotel,
    required this.rooms,
  });

  @override
  List<Object> get props => [
        this.hotel,
        this.rooms,
      ];
}

class HotelPageError extends HotelPageState {
  final String error;

  HotelPageError({required this.error});

  @override
  List<Object> get props => [this.error];
}

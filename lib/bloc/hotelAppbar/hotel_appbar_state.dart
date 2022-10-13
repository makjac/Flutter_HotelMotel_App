// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hotel_appbar_bloc.dart';

abstract class HotelAppbarState extends Equatable {
  const HotelAppbarState();

  @override
  List<Object> get props => [];
}

class HotelAppbarInitial extends HotelAppbarState {}

class ChangingFavorite extends HotelAppbarState {}

class AddedFavorite extends HotelAppbarState {}

class RemovedFavorite extends HotelAppbarState {}

class ErrorHotelAppbar extends HotelAppbarState {
  final String error;
  ErrorHotelAppbar({
    required this.error,
  });

  @override
  List<Object> get props => [this.error];
}

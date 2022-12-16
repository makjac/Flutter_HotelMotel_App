// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class LoadingFavoriteHotels extends FavoriteState {}

class FavoriteHotelsLoaded extends FavoriteState {
  final List<HotelThumbnailModel> hotels;
  FavoriteHotelsLoaded({
    required this.hotels,
  });
}

class NoFavorites extends FavoriteState {}

class FavoriteError extends FavoriteState {
  final String error;
  FavoriteError({
    required this.error,
  });
}

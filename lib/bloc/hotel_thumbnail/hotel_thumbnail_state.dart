// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hotel_thumbnail_bloc.dart';

abstract class HotelThumbnailState extends Equatable {
  const HotelThumbnailState();

  @override
  List<Object> get props => [];
}

class HotelThumbnailInitial extends HotelThumbnailState {}

class ThumbnailsLoading extends HotelThumbnailState {}

class ThumbnailsLoaded extends HotelThumbnailState {
  final List<HotelThumbnailModel> hotelThumbnails;
  ThumbnailsLoaded({
    this.hotelThumbnails = const <HotelThumbnailModel>[],
  });

  @override
  List<Object> get props => [hotelThumbnails];
}

class ThumbnailError extends HotelThumbnailState {
  final String error;
  ThumbnailError({
    required this.error,
  });
}

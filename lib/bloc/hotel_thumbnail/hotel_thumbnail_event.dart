// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hotel_thumbnail_bloc.dart';

abstract class HotelThumbnailEvent extends Equatable {
  const HotelThumbnailEvent();

  @override
  List<Object> get props => [];
}

class LoadThumbnails extends HotelThumbnailEvent {}

class UpdateThumbnails extends HotelThumbnailEvent {
  final List<HotelThumbnailModel> thumbnails;
  UpdateThumbnails({
    required this.thumbnails,
  });

  @override
  List<Object> get props => [thumbnails];
}

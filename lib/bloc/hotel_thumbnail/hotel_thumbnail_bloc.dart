import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_thumbnail/hotel_thumbnail_repository.dart';

part 'hotel_thumbnail_event.dart';
part 'hotel_thumbnail_state.dart';

class HotelThumbnailBloc
    extends Bloc<HotelThumbnailEvent, HotelThumbnailState> {
  final HotelThumbnailRepository _hotelThumbnailRepository;
  StreamSubscription? _streamSubscription;

  HotelThumbnailBloc(
      {required HotelThumbnailRepository hotelThumbnailRepository})
      : _hotelThumbnailRepository = hotelThumbnailRepository,
        super(HotelThumbnailInitial()) {
    on<LoadThumbnails>(_loadThumbnails);
    on<UpdateThumbnails>(_updateThumbnails);
  }

  FutureOr<void> _loadThumbnails(
      LoadThumbnails event, Emitter<HotelThumbnailState> emit) async {
    try {
      emit(ThumbnailsLoading());
      await _hotelThumbnailRepository.getAllThumbnails().then(
        (thumbnails) {
          emit(ThumbnailsLoaded(hotelThumbnails: thumbnails));
        },
      ).onError(
        (error, stackTrace) => throw Exception(error.toString()),
      );

      //UpdateThumbnails(thumbnails: thumbnails);
    } catch (e) {
      emit(ThumbnailError(error: e.toString()));
    }
  }

  FutureOr<void> _updateThumbnails(
      UpdateThumbnails event, Emitter<HotelThumbnailState> emit) async {
    emit(ThumbnailsLoaded(hotelThumbnails: event.thumbnails));
  }
}

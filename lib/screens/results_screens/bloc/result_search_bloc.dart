import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/models/results_filters.dart';
import 'package:hotel_motel/data/models/search_cryteria.dart';
import 'package:hotel_motel/data/repository/http/http_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';
import 'package:hotel_motel/screens/results_screens/utils/results_sort_values.dart';
import 'package:hotel_motel/utils/numbers.dart';

part 'result_search_event.dart';
part 'result_search_state.dart';

class ResultSearchBloc extends Bloc<ResultSearchEvent, ResultSearchState> {
  final HttpRepository _httpRepository;
  final HotelRepository _hotelRepository;
  final RoomRepository _roomRepository;
  List<HotelThumbnailModel> thumbnails = [];
  ResultSearchBloc(
      {HttpRepository? httpRepository,
      HotelRepository? hotelRepository,
      RoomRepository? roomRepository})
      : _httpRepository = httpRepository ?? HttpRepository(),
        _hotelRepository = hotelRepository ?? HotelRepository(),
        _roomRepository = roomRepository ?? RoomRepository(),
        super(ResultSearchInitial()) {
    on<LoadSearchResults>(_loadResults);
    on<UpdateResults>(_updateResults);
    on<SortResults>(_sortResults);
  }

  FutureOr<void> _loadResults(
      LoadSearchResults event, Emitter<ResultSearchState> emit) async {
    try {
      emit(LoadingResults());
      thumbnails = [];
      var hotels = await _hotelRepository
          .getHotelsFromLocation(event.searchCryteria.location);
      await hotels.forEach((hotelList) async {
        hotelList.forEach((hotel) async {
          if (!thumbnails
              .any((thumbnail) => thumbnail.hotelID == hotel.hotelID)) {
            var roomList = await _roomRepository.getHotelRooms(hotel.hotelID);
            await roomList.forEach((rooms) async {
              rooms.forEach((room) async {
                var colision = await _httpRepository.getBookingColision(
                    room.roomID, event.searchCryteria.timeRange);
                final availableRooms =
                    await await room.numberOfRooms - colision;
                if (availableRooms > 0) {
                  if (availableRooms *
                          room.capacity *
                          event.searchCryteria.rooms >
                      event.searchCryteria.adults + event.searchCryteria.kids) {
                    thumbnails.add(HotelThumbnailModel.fromModels(hotel, room));
                    thumbnails.sort((a, b) => b.rating.compareTo(a.rating));
                    emit(LoadingMore());
                  }
                }
                emit(ResultsLoaded(thumbnails: thumbnails));
              });
            });
          }
        });
      });
    } catch (error) {
      emit(ResultsError(error: error.toString()));
    }
  }

  FutureOr<void> _sortResults(
      SortResults event, Emitter<ResultSearchState> emit) async {
    try {
      final filtredResults = _filterResults(event.filters);
      emit(SortingResults());
      switch (event.value) {
        case SortValues.sortPriceHL:
          filtredResults.sort(
            (a, b) => b.price.compareTo(a.price),
          );
          emit(ResultsLoaded(thumbnails: filtredResults));
          break;
        case SortValues.sortPriceLH:
          filtredResults.sort(
            (a, b) => a.price.compareTo(b.price),
          );
          emit(ResultsLoaded(thumbnails: filtredResults));
          break;
        case SortValues.sortRatingHL:
          filtredResults.sort(
            (a, b) => b.rating.compareTo(a.rating),
          );
          emit(ResultsLoaded(thumbnails: filtredResults));
          break;
        case SortValues.sortRatingLH:
          filtredResults.sort(
            (a, b) => a.rating.compareTo(b.rating),
          );
          emit(ResultsLoaded(thumbnails: filtredResults));
          break;
        default:
          break;
      }
    } catch (error) {
      emit(ResultsError(error: error.toString()));
    }
  }

  List<HotelThumbnailModel> _filterResults(ResultsFilters filter) {
    return thumbnails.where((thumbnail) {
      var reducedPrice = thumbnail.price * (1 - thumbnail.discount);

      if (filter.priceRange.start <= reducedPrice &&
          (filter.priceRange.end == 1000 ||
              reducedPrice < filter.priceRange.end) &&
          Numbers.isNumberInRange(
              (thumbnail.rating / 100) * 5, filter.ratingRange)) {
        if (filter.isFreeCancelling) {
          return thumbnail.isFeeCanceling;
        }
        return true;
      }
      return false;
    }).toList();
  }

  FutureOr<void> _updateResults(
      UpdateResults event, Emitter<ResultSearchState> emit) async {
    try {
      emit(ResultsLoaded(thumbnails: event.thumbnails));
    } catch (error) {
      emit(ResultsError(error: error.toString()));
    }
  }
}

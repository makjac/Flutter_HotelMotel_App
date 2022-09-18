// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'result_search_bloc.dart';

abstract class ResultSearchEvent extends Equatable {
  const ResultSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchResults extends ResultSearchEvent {
  SearchCryteria searchCryteria;
  LoadSearchResults({
    required this.searchCryteria,
  });

  @override
  List<Object> get props => [this.searchCryteria];
}

class SortResults extends ResultSearchEvent {
  final SortValues value;
  SortResults({
    required this.value,
  });

  @override
  List<Object> get props => [this.value];
}

class UpdateResults extends ResultSearchEvent {
  final List<HotelThumbnailModel> thumbnails;
  UpdateResults({
    required this.thumbnails,
  });

  @override
  List<Object> get props => [this.thumbnails];
}

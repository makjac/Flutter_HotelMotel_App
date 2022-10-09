part of 'result_search_bloc.dart';

abstract class ResultSearchEvent extends Equatable {
  const ResultSearchEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
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
  final ResultsFilters filters;
  SortResults({
    required this.value,
    required this.filters,
  });

  @override
  List<Object> get props => [
        this.value,
        this.filters,
      ];
}

class UpdateResults extends ResultSearchEvent {
  final List<HotelThumbnailModel> thumbnails;
  UpdateResults({
    required this.thumbnails,
  });

  @override
  List<Object> get props => [this.thumbnails];
}

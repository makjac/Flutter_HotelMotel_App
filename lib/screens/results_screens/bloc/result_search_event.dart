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
}

class UpdateResults extends ResultSearchEvent {
  final List<HotelThumbnailModel> thumbnails;
  UpdateResults({
    required this.thumbnails,
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'result_search_bloc.dart';

abstract class ResultSearchState extends Equatable {
  const ResultSearchState();

  @override
  List<Object> get props => [];
}

class ResultSearchInitial extends ResultSearchState {}

class LoadingResults extends ResultSearchState {}

class ResultsLoaded extends ResultSearchState {
  final List<HotelThumbnailModel> thumbnails;
  ResultsLoaded({
    required this.thumbnails,
  });
}

class NoResults extends ResultSearchState {}

class ResultsError extends ResultSearchState {
  final String error;
  ResultsError({
    required this.error,
  });
}

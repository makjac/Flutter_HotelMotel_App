part of 'rcomended_bloc.dart';

abstract class RecomendedState extends Equatable {
  const RecomendedState();

  @override
  List<Object> get props => [];
}

class RcomendedInitial extends RecomendedState {}

class LoadingRecommendation extends RecomendedState {}

class LoadingMoreRecommendation extends RecomendedState {}

class RecommendationLoaded extends RecomendedState {
  final List<HotelThumbnailModel> thumbnails;

  RecommendationLoaded({required this.thumbnails});

  @override
  List<Object> get props => [
        this.thumbnails,
      ];
}

class RecomendedError extends RecomendedState {
  final String error;

  RecomendedError({required this.error});

  @override
  List<Object> get props => [
        this.error,
      ];
}

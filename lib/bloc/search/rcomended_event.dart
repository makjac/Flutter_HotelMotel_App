part of 'rcomended_bloc.dart';

abstract class RecomendedEvent extends Equatable {
  const RecomendedEvent();

  @override
  List<Object> get props => [];
}

class LoadRecommendation extends RecomendedEvent {}

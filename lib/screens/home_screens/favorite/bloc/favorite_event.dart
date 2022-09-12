part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadHotelsEvt extends FavoriteEvent {}

class UpdateHotelsEvt extends FavoriteEvent {}

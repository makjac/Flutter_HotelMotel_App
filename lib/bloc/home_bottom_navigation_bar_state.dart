part of 'home_bottom_navigation_bar_bloc.dart';

@immutable
abstract class HomeBottomNavigationBarState {}

class HomeBottomNavigationBarInitial extends HomeBottomNavigationBarState {}

class IndexChanged extends HomeBottomNavigationBarState {}

class PageLoading extends HomeBottomNavigationBarState {}

class SearchPageLoaded extends HomeBottomNavigationBarState {}

class FavoritePageLoaded extends HomeBottomNavigationBarState {}

class BookingPageLoaded extends HomeBottomNavigationBarState {}

class ProfilePageLoaded extends HomeBottomNavigationBarState {}

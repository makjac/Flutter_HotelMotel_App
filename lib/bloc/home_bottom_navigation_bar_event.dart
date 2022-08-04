// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bottom_navigation_bar_bloc.dart';

@immutable
abstract class HomeBottomNavigationBarEvent {}

class PacheTappedEvt extends HomeBottomNavigationBarEvent {
  final int index;

  PacheTappedEvt({
    required this.index,
  });

  @override
  String toString() => 'PacheTappedEvt(index: $index)';
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bottom_navigation_bar_event.dart';
part 'home_bottom_navigation_bar_state.dart';

class HomeBottomNavigationBarBloc extends Bloc<HomeBottomNavigationBarEvent, HomeBottomNavigationBarState> {
  HomeBottomNavigationBarBloc() : super(HomeBottomNavigationBarInitial()) {
    on<HomeBottomNavigationBarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

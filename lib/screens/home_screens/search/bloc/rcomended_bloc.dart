import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rcomended_event.dart';
part 'rcomended_state.dart';

class RcomendedBloc extends Bloc<RcomendedEvent, RcomendedState> {
  RcomendedBloc() : super(RcomendedInitial()) {
    on<RcomendedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

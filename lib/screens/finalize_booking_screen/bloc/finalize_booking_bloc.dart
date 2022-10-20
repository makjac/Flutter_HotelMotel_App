import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/data/models/user_details.dart';
import 'package:hotel_motel/data/repository/model_repositores/user_details_repository/user_details_repository.dart';

part 'finalize_booking_event.dart';
part 'finalize_booking_state.dart';

class FinalizeBookingBloc
    extends Bloc<FinalizeBookingEvent, FinalizeBookingState> {
  final UserDetailsRepository _userDetailsRepository;
  UserDetails? userDetails;

  FinalizeBookingBloc({UserDetailsRepository? userDetailsRepository})
      : _userDetailsRepository =
            userDetailsRepository ?? UserDetailsRepository(),
        super(FinalizeBookingInitial()) {
    on<LoadDetails>(_loadDetails);
    on<UpdateUserDetails>(_updateDetails);
  }

  FutureOr<void> _loadDetails(
      LoadDetails event, Emitter<FinalizeBookingState> emit) async {
    try {
      emit(LoadingDetails());
      await _userDetailsRepository
          .getUserDetails(event.userUid)
          .listen((details) {
        userDetails = details;
        emit(UserDetailsLoaded(userDetails: details));
      }).asFuture();
    } catch (error) {
      emit(ErrorFinalizeBooking(error: error.toString()));
    }
  }

  FutureOr<void> _updateDetails(
      UpdateUserDetails event, Emitter<FinalizeBookingState> emit) async {
    try {
      emit(UpdatingUserDetails());
      await _userDetailsRepository.updateUserDetails(
          event.userUid, event.userDetails);
      emit(UserDetailsUpdated());
    } catch (error) {
      emit(ErrorFinalizeBooking(error: error.toString()));
    }
  }
}

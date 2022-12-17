import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/repository/model_repositores/booking_repository/booking_repository.dart';
import 'package:hotel_motel/repository/model_repositores/user_details_repository/user_details_repository.dart';

import '../../models/booking_model.dart';
import '../../models/user_details.dart';

part 'finalize_booking_event.dart';
part 'finalize_booking_state.dart';

class FinalizeBookingBloc
    extends Bloc<FinalizeBookingEvent, FinalizeBookingState> {
  final UserDetailsRepository _userDetailsRepository;
  final BookingRepository _bookingRepository;
  UserDetails? userDetails;

  FinalizeBookingBloc({
    UserDetailsRepository? userDetailsRepository,
    BookingRepository? bookingRepository,
  })  : _userDetailsRepository =
            userDetailsRepository ?? UserDetailsRepository(),
        _bookingRepository = bookingRepository ?? BookingRepository(),
        super(FinalizeBookingInitial()) {
    on<LoadDetails>(_loadDetails);
    on<UpdateUserDetails>(_updateDetails);
    on<CreateBooking>(_createBooking);
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

  FutureOr<void> _createBooking(
      CreateBooking event, Emitter<FinalizeBookingState> emit) async {
    try {
      emit(CreatingBooking());
      await _bookingRepository.createBooking(event.booking);
      emit(BookingCreated());
    } catch (error) {
      emit(ErrorFinalizeBooking(error: error.toString()));
    }
  }
}

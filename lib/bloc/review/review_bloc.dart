import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/repository/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/service/analitics_service/analitics_service.dart';

import '../../models/review_model.dart';
import '../../repository/booking_repository/booking_repository.dart';
import '../../repository/review_repository/review_repository.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository _reviewRepository;
  final BookingRepository _bookingRepository;
  ReviewBloc(
      {ReviewRepository? reviewRepository,
      BookingRepository? bookingRepository})
      : _reviewRepository = reviewRepository ?? ReviewRepository(),
        _bookingRepository = bookingRepository ?? BookingRepository(),
        super(ReviewInitial()) {
    on<AddReview>(_addReview);
  }

  FutureOr<void> _addReview(AddReview event, Emitter<ReviewState> emit) async {
    try {
      emit(AddingReview());
      await _bookingRepository.updateReviewStatus(event.review.bookingID, true);
      await _reviewRepository.AddhotelReview(event.review);
      await locator.get<HotelRepository>().updateHotelScores(event.review);
      await locator.get<AnaliticsService>().LogAddItemReview(event.review);
      emit(ReviewAdded());
    } catch (error) {
      emit(ErrorReview(error: error.toString()));
    }
  }
}

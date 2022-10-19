// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'review_bloc.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class AddReview extends ReviewEvent {
  final ReviewModel review;
  AddReview({
    required this.review,
  });

  @override
  List<Object> get props => [review];
}

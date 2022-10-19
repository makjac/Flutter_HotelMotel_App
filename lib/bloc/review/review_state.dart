// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'review_bloc.dart';

abstract class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

class ReviewInitial extends ReviewState {}

class AddingReview extends ReviewState {}

class ReviewAdded extends ReviewState {}

class ErrorReview extends ReviewState {
  final String error;
  ErrorReview({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

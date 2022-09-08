// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  CategoryLoaded({
    this.categories = const <Category>[],
  });

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {
  final String error;
  CategoryError({
    required this.error,
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {}

class UpdateCategory extends CategoryEvent {
  final List<Category> categories;
  UpdateCategory({
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}

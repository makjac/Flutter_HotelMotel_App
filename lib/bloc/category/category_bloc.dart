import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';
import '../../repository/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryInitial()) {}

  Stream<CategoryState> mapEventTostate(CategoryEvent event) async* {
    if (event is LoadCategories) {
      yield* _loadCategories();
    }
    if (event is UpdateCategory) {
      yield* _updateCategories(event);
    }
  }

  Stream<CategoryState> _loadCategories() async* {
    _categorySubscription?.cancel();
    _categorySubscription = await _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategory(categories: categories),
          ),
        );
  }

  Stream<CategoryState> _updateCategories(UpdateCategory event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}

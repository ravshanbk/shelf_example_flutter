part of 'get_category_bloc.dart';

abstract class GetCategoryState {}

class GetCategoryInitial extends GetCategoryState {}

class GetCategoryLoadingState extends GetCategoryState {}

class GetCategoryCategoriesState extends GetCategoryState {
  final List<CategoryModel> categories;
  GetCategoryCategoriesState(this.categories);
}

class GetCategoryEmptyState extends GetCategoryState {}

class GetCategoryFailedState extends GetCategoryState {
  final String error;
  GetCategoryFailedState(this.error);
}

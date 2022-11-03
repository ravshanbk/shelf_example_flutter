part of 'category_bloc.dart';

@immutable
abstract class AddCategoryState {}

class AddCategoryInitial extends AddCategoryState {
  final bool retry;
  AddCategoryInitial(this.retry);
}

class AddCategoryLoadingState extends AddCategoryState {}

class AddCategoryUploadSuccedState extends AddCategoryState {}

class AddCategoryUploadFailedState extends AddCategoryState {}

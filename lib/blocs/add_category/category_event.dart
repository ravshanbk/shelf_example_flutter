part of 'category_bloc.dart';

@immutable
abstract class AddCategoryEvent {}

class AddCategoryUploadEvent extends AddCategoryEvent {
  final String name;
  AddCategoryUploadEvent(this.name);
}

class AddCategoryContinueEvent extends AddCategoryEvent {}

class AddCategoryCallInitial extends AddCategoryEvent {}

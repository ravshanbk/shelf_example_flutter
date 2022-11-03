part of 'get_item_bloc.dart';

abstract class GetItemState {}

class GetItemInitial extends GetItemState {}

class GetItemLoadingState extends GetItemState {}

class GetItemItemsState extends GetItemState {
  final List<ItemModel> items;
  GetItemItemsState(this.items);
}

class GetItemErrorState extends GetItemState {
  final String error;
  GetItemErrorState(this.error);
}

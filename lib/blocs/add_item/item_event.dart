part of 'item_bloc.dart';

abstract class ItemEvent {}

class ItemAddEvent extends ItemEvent {
  ItemModel item;
  ItemAddEvent(this.item);
}
class ItemUploadEvent extends ItemEvent{

}
class ItemCallInitialEvent extends ItemEvent{
  
}

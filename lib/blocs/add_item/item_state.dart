part of 'item_bloc.dart';

abstract class ItemState {}

class ItemInitial extends ItemState {
  bool rebuild;
  ItemInitial(this.rebuild);
}
class ItemLoadingState extends ItemState{

}
class ItemUploadSuccedState extends ItemState{
  
}
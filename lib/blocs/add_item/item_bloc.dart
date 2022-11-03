import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelf_example_flutter/api/item_api.dart';
import 'package:shelf_example_flutter/models/item_model.dart';
import 'package:shelf_example_flutter/utils/colored_print.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  List<ItemModel> items = [];
  ItemBloc() : super(ItemInitial(false)) {
    on<ItemAddEvent>(_add);
    on<ItemUploadEvent>(_upload);
    on<ItemCallInitialEvent>(_callInitial);
  }
  _callInitial(ItemCallInitialEvent event, Emitter<ItemState> emit) {
    emit(ItemInitial(true));
  }

  _upload(ItemUploadEvent event, Emitter<ItemState> emit) async {
    if (items.isEmpty) return;
    "upload evnt".printf();
    emit(ItemLoadingState());
    await ItemApi.uploadItems(items);
    emit(ItemUploadSuccedState());
  }

  _add(ItemAddEvent event, Emitter<ItemState> emit) {
    event.item.name.printf("item name");
    event.item.toJson().printf("item in json");
    items.add(event.item);
    emit(ItemInitial(true));
  }
}

import 'package:bloc/bloc.dart';
import 'package:shelf_example_flutter/api/item_api.dart';
import 'package:shelf_example_flutter/models/http_result_model.dart';
import 'package:shelf_example_flutter/models/item_model.dart';
import 'package:shelf_example_flutter/singletons/item_singleton.dart';
import 'package:shelf_example_flutter/utils/colored_print.dart';

part 'get_item_event.dart';
part 'get_item_state.dart';

class GetItemBloc extends Bloc<GetItemEvent, GetItemState> {
  GetItemBloc() : super(GetItemInitial()) {
    on<GetItemGetEvent>(_get);
  }
  _get(GetItemGetEvent event, Emitter<GetItemState> emit) async {
    emit(GetItemLoadingState());
    HttpResult httpResult = await ItemApi.getItems();
    if (httpResult.isSuccess) {
      List<ItemModel> items = ItemSingleton.getItemsFromResponse(httpResult);
      "".printf("${items.length}");
      emit(GetItemItemsState(items));
      return;
    }
    emit(GetItemErrorState(httpResult.result.toString()));
  }
}

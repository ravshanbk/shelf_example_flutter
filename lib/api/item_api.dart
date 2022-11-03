import 'package:shelf_example_flutter/api/app_service/service.dart';
import 'package:shelf_example_flutter/models/http_result_model.dart';
import 'package:shelf_example_flutter/models/item_model.dart';
import 'package:shelf_example_flutter/singletons/item_singleton.dart';

class ItemApi {
  static Future<HttpResult> uploadItems(List<ItemModel> items) async {
    final body = ItemSingleton.itemsEncode(items);
    return await AppService.postResponse(
      path: "/items/add",
      body: body,
    );
  }

  static Future<HttpResult> getItems() async {
    return await AppService.getResponse(
        path: "/items/getAll");
  }
}

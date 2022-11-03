import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shelf_example_flutter/models/http_result_model.dart';
import 'package:shelf_example_flutter/models/item_model.dart';

class ItemSingleton {
  static List<ItemModel> getItemsFromResponse(HttpResult httpResult) {
    
    return (httpResult.result as List).map((e) => ItemModel.fromJson(e)).toList();
  }

  static String itemsEncode(List<ItemModel> items) {
    List<dynamic> mapList = [];
    for (int i = 0; i < items.length; i++) {
      mapList.add(items[i].toJson());
    }

    return jsonEncode(mapList);
  }

  static ItemModel itemFromControllers(List<TextEditingController> c) {
    final item = ItemModel(
      name: c[0].text,
      barcode: c[1].text,
      sku: int.parse(c[2].text),
      categoryId: c[3].text,
      inStock: int.parse(c[4].text),
      price: int.parse(c[5].text),
      camePrice: int.parse(c[6].text),
    );
    return item;
  }
}

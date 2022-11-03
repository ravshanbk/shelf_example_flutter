import 'package:shelf_example_flutter/models/category_model.dart';
import 'package:shelf_example_flutter/objectbox.g.dart';
import 'package:shelf_example_flutter/storage/app_object_box.dart';

class CategorySingleton {
  static void saveOnBoxx(List<CategoryModel> categories) async {
    try {
      Box box = AppObjectbox.categoryStore.box<CategoryModel>();
      box.removeAll();
      box.putMany(categories);
    } catch (e) {
      throw Exception("THIS IS THE PUT CATEGORY EXEPTION $e");
    }
    return;
  }
}

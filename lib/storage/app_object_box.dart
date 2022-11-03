// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shelf_example_flutter/objectbox.g.dart';

class AppObjectbox {
  static late Store categoryStore;

  static Future<void> init() async {
    final dir = await path_provider.getApplicationDocumentsDirectory();

    categoryStore = Store(
      getObjectBoxModel(),
      directory: path.join(dir.path, "category_db"),
    );
  }
}

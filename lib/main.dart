import 'package:flutter/material.dart';
import 'package:shelf_example_flutter/app/my_app.dart';
import 'package:shelf_example_flutter/storage/app_object_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppObjectbox.init();
  runApp(const MyApp());
}

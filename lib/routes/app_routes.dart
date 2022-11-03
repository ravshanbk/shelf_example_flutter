import 'package:flutter/material.dart';
import 'package:shelf_example_flutter/app/wrapper.dart';
import 'package:shelf_example_flutter/routes/route_names.dart';
import 'package:shelf_example_flutter/ui/category/add_category.dart';
import 'package:shelf_example_flutter/ui/category/see_category.dart';
import 'package:shelf_example_flutter/ui/item/add_item.dart';
import 'package:shelf_example_flutter/ui/item/see_item.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.WRAPPER:
        return _route(const Wrapper());
      case RouteName.addITEM:
        return _route(AddItemPage());
      case RouteName.seeITEM:
        return _route(const SeeItemsPage());
    
      case RouteName.seeCATEGORY:
        return _route(const SeeCategoryPage());
      case RouteName.addCATEGORY:
        return _route( AddCategoryPage());
    }
    return null;
  }

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}

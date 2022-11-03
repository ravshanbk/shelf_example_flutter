import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelf_example_flutter/app/wrapper.dart';
import 'package:shelf_example_flutter/blocs/add_category/category_bloc.dart';
import 'package:shelf_example_flutter/blocs/add_item/item_bloc.dart';
import 'package:shelf_example_flutter/blocs/get_category/get_category_bloc.dart';
import 'package:shelf_example_flutter/blocs/get_item/get_item_bloc.dart';
import 'package:shelf_example_flutter/routes/app_routes.dart';
import 'package:shelf_example_flutter/routes/navigation/app_navigation.dart';
import 'package:shelf_example_flutter/routes/route_names.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ItemBloc()),
        BlocProvider(create: (_) => GetItemBloc()),
        BlocProvider(create: (_) => GetCategoryBloc()),
        BlocProvider(create: (_) => AddCategoryBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppNavigation.navigatorKey,
        initialRoute: RouteName.WRAPPER,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Wrapper(),
      ),
    );
  }
}

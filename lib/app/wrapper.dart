import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelf_example_flutter/blocs/get_category/get_category_bloc.dart';
import 'package:shelf_example_flutter/blocs/get_item/get_item_bloc.dart';
import 'package:shelf_example_flutter/routes/navigation/app_navigation.dart';
import 'package:shelf_example_flutter/routes/route_names.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wrapper")),
      body: Center(
        child: ListView.builder(
          itemCount: RouteName.routeNames.length,
          itemBuilder: (_, __) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  switch (RouteName.routeNames[__]) {
                    case RouteName.seeITEM:
                      {
                        GetItemBloc getItemBloc = BlocProvider.of(context);
                        getItemBloc.add(GetItemGetEvent());
                        break;
                      }

                    case RouteName.seeCATEGORY:
                      {
                        
                        GetCategoryBloc getCategoryBloc =
                            BlocProvider.of(context);
                        getCategoryBloc.add(GetCategoryGetEvent());
                      }
                      break;
                    default:
                      break;
                  }
                  AppNavigation.pushNamed(RouteName.routeNames[__]);
                },
                child: Text(
                  RouteName.routeNames[__],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

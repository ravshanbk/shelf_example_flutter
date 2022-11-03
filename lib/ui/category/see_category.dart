import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelf_example_flutter/blocs/get_category/get_category_bloc.dart';
import 'package:shelf_example_flutter/models/category_model.dart';
import 'package:shelf_example_flutter/routes/navigation/app_navigation.dart';
import 'package:shelf_example_flutter/widgets/yes_no_button.dart';

class SeeCategoryPage extends StatelessWidget {
  const SeeCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetCategoryBloc getCategoryBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("See Category"),
      ),
      body: Center(child: BlocBuilder<GetCategoryBloc, GetCategoryState>(
        builder: (context, state) {
          if (state is GetCategoryEmptyState) {
            return Column(
              children: [
                const Text("Categories is empty"),
                YesNoButton(
                  callbackL: () => AppNavigation.pop(),
                  callbackR: () => getCategoryBloc.add(
                    GetCategoryGetEvent(),
                  ),
                ),
              ],
            );
          }
          if (state is GetCategoryCategoriesState) {
            return ListView.separated(
              itemBuilder: (_, __) {
                CategoryModel c = state.categories[__];
                return ListTile(
                  title: Text("$__. ${c.name ?? ''}"),
                  subtitle: Text("${c.id ?? 0}"),
                  trailing: Text(c.categoryId ?? ''),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: state.categories.length,
            );
          }
          if (state is GetCategoryLoadingState) {
            return const CupertinoActivityIndicator();
          }
          return const Text("State managment error");
        },
      )),
    );
  }
}

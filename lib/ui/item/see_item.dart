import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelf_example_flutter/blocs/get_item/get_item_bloc.dart';
import 'package:shelf_example_flutter/routes/navigation/app_navigation.dart';
import 'package:shelf_example_flutter/widgets/yes_no_button.dart';

class SeeItemsPage extends StatelessWidget {
  const SeeItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetItemBloc getItemBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("See items")),
      body: Center(
        child: BlocBuilder<GetItemBloc, GetItemState>(
          builder: (context, state) {
            if (state is GetItemErrorState) {
              return Column(
                children: [
                  Text(state.error),
                  YesNoButton(
                    callbackL: () => AppNavigation.pop(),
                    callbackR: () => getItemBloc.add(GetItemGetEvent()),
                    titleL: "Ok",
                    titleR: "Retry",
                  )
                ],
              );
            }
            if (state is GetItemItemsState) {
              return ListView.separated(
                itemBuilder: (_, __) {
                  return ListTile(
                    title: Text(state.items[__].name ?? ""),
                    subtitle: Text(state.items[__].barcode ?? ""),
                    trailing: Text("${state.items[__].price ?? 0}"),
                    leading: Text(
                      state.items[__].categoryId ?? "",
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: state.items.length,
              );
            }
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}

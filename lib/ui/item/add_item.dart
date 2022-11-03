import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelf_example_flutter/blocs/add_item/item_bloc.dart';
import 'package:shelf_example_flutter/models/category_model.dart';
import 'package:shelf_example_flutter/models/item_model.dart';
import 'package:shelf_example_flutter/routes/navigation/app_navigation.dart';
import 'package:shelf_example_flutter/singletons/item_singleton.dart';
import 'package:shelf_example_flutter/storage/app_object_box.dart';
import 'package:shelf_example_flutter/utils/colored_print.dart';
import 'package:shelf_example_flutter/widgets/default_input_field.dart.dart';
import 'package:shelf_example_flutter/widgets/yes_no_button.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<TextEditingController> controllers =
      List.generate(7, (index) => TextEditingController());

  final List<String> hints = const [
    "Name",
    "Barcode",
    "Sku",
    "Category Id",
    "Quantity",
    "Price",
    "Came Price",
  ];
  late List<CategoryModel> categories;
  @override
  void initState() {
    categories = AppObjectbox.categoryStore.box<CategoryModel>().getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    "".printf("${categories.length}");
    ItemBloc itemBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: Center(
        child: BlocConsumer<ItemBloc, ItemState>(
          listener: ((context, state) {
            if (state is ItemInitial) {
              if (state.rebuild) {
                controllers = List.generate(7, (i) => TextEditingController());
              }
            }
          }),
          builder: (context, state) {
            if (state is ItemLoadingState) {
              return const CupertinoActivityIndicator();
            }
            if (state is ItemUploadSuccedState) {
              return Column(
                children: [
                  const Text("Upload Succed !!!"),
                  ElevatedButton(
                      onPressed: () => itemBloc.add(ItemCallInitialEvent()),
                      child: const Text("Yana qo'shish")),
                  ElevatedButton(
                      onPressed: () => AppNavigation.pop(),
                      child: const Text("Ok"))
                ],
              );
            }
            return Column(
              children: [
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: hints.length + 1,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              maxCrossAxisExtent: 400,
                              childAspectRatio: 5),
                      itemBuilder: (_, __) {
                        return hints.length == __
                            ? DropdownButton(
                                autofocus: true,
                                items: categories
                                    .map((e) => DropdownMenuItem<CategoryModel>(
                                          value: e,
                                          onTap: () {
                                            e.name?.printf("selected category");
                                            controllers[3].text = e.categoryId!;
                                          },
                                          child: Text(e.name ?? "",
                                              key: Key("category key ${e.id}")),
                                        ))
                                    .toList(),
                                onChanged: (v) {
                                  "".printf("on changed");
                                })
                            : DefaultFormField(
                                controller: controllers[__],
                                hintText: "${hints[__]} $__",
                              );
                      },
                    ),
                  ),
                ),
                YesNoButton(
                  callbackL: () async {
                    if (_formKey.currentState!.validate()) {
                      ItemModel item =
                          ItemSingleton.itemFromControllers(controllers);
                      itemBloc.add(ItemAddEvent(item));
                    }
                  },
                  callbackR: () => itemBloc.add(ItemUploadEvent()),
                  titleL: "Add",
                  titleR:
                      "Upload ${itemBloc.items.isEmpty ? "" : itemBloc.items.length}",
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

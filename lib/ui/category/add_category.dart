import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelf_example_flutter/blocs/add_category/category_bloc.dart';
import 'package:shelf_example_flutter/routes/navigation/app_navigation.dart';
import 'package:shelf_example_flutter/widgets/default_input_field.dart.dart';
import 'package:shelf_example_flutter/widgets/yes_no_button.dart';

class AddCategoryPage extends StatelessWidget {
  AddCategoryPage({Key? key}) : super(key: key);
  List<TextEditingController> controllers =
      List.generate(1, (index) => TextEditingController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> hints = [
    "Name",
    
  ];
  @override
  Widget build(BuildContext context) {
    AddCategoryBloc categoryBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Add Category")),
      body: Center(
        child: BlocConsumer<AddCategoryBloc, AddCategoryState>(
          listener: ((context, state) {
            if (state is AddCategoryInitial) {
              if (state.retry) {
                controllers = List.generate(1, (i) => TextEditingController());
              }
            }
          }),
          builder: (context, state) {
            if (state is AddCategoryUploadFailedState) {
              return Column(
                children: [
                  const Text("Upload failed"),
                  YesNoButton(
                      callbackL: () => AppNavigation.pop(),
                      callbackR: () =>
                          categoryBloc.add(AddCategoryCallInitial()))
                ],
              );
            }
            if (state is AddCategoryUploadSuccedState) {
              return Column(
                children: [
                  const Text("Upload Succed"),
                  YesNoButton(
                    callbackL: () => AppNavigation.pop(),
                    callbackR: () =>
                        categoryBloc.add(AddCategoryContinueEvent()),
                  ),
                ],
              );
            }
            if (state is AddCategoryLoadingState) {
              return const CupertinoActivityIndicator();
            }
            return Column(
              children: [
                Form(
                  key: _formKey,
                  child: GridView.builder(
                      padding: const EdgeInsets.all(20.0),
                      shrinkWrap: true,
                      itemCount: hints.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 10,
                        childAspectRatio: 5,
                      ),
                      itemBuilder: (_, __) {
                        return DefaultFormField(
                          controller: controllers[__],
                          hintText: hints[__],
                        );
                      }),
                ),
                YesNoButton(
                  titleL: "Cancel",
                  callbackL: () => AppNavigation.pop(),
                  titleR: "Upload",
                  callbackR: () {
                    if (_formKey.currentState!.validate()) {
                      categoryBloc
                          .add(AddCategoryUploadEvent(controllers[0].text));
                    }
                    return;
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

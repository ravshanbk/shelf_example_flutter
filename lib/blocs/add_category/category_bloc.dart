import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shelf_example_flutter/api/app_service/service.dart';
import 'package:shelf_example_flutter/models/http_result_model.dart';
import 'package:shelf_example_flutter/utils/colored_print.dart';

part 'category_event.dart';
part 'category_state.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  AddCategoryBloc() : super(AddCategoryInitial(false)) {
    on<AddCategoryUploadEvent>(_upload);
    on<AddCategoryContinueEvent>(_continue);
    on<AddCategoryCallInitial>(_callInitial);
  }
  _callInitial(AddCategoryCallInitial event, Emitter<AddCategoryState> emit) {
    emit(AddCategoryInitial(false));
  }

  _continue(AddCategoryContinueEvent event, Emitter<AddCategoryState> emit) {
    emit(AddCategoryInitial(true));
  }

  _upload(AddCategoryUploadEvent event, Emitter<AddCategoryState> emit) async {
    emit(AddCategoryLoadingState());
    var id = DateTime.now().millisecondsSinceEpoch;
    id.toString().printf("generated id");
    HttpResult httpResult = await AppService.postResponse(
        path: Urls.categoryUpload,
        body: jsonEncode({"name": event.name, "categoryId":id}));
    if (httpResult.isSuccess) {
      emit(AddCategoryUploadSuccedState());
      return;
    }
    emit(AddCategoryUploadFailedState());
  }
}

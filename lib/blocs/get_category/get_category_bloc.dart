import 'package:bloc/bloc.dart';
import 'package:shelf_example_flutter/api/app_service/service.dart';
import 'package:shelf_example_flutter/models/category_model.dart';
import 'package:shelf_example_flutter/models/http_result_model.dart';
import 'package:shelf_example_flutter/singletons/category_singleton.dart';
import 'package:shelf_example_flutter/utils/colored_print.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  GetCategoryBloc() : super(GetCategoryInitial()) {
    on<GetCategoryGetEvent>(_get);
  }

  _get(GetCategoryGetEvent event, Emitter<GetCategoryState> emit) async {
    emit(GetCategoryLoadingState());
    HttpResult httpResult =
        await AppService.getResponse(path: "/category/getAll");
    httpResult.result.toString().printf("get category result");
    if (httpResult.isSuccess) {
      List<CategoryModel> categories = (httpResult.result as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      if (categories.isEmpty) {
        emit(GetCategoryEmptyState());
      } else {
        CategorySingleton.saveOnBoxx(categories);
        emit(GetCategoryCategoriesState(categories));
      }
      return;
    }
    emit(GetCategoryFailedState(httpResult.result.toString()));
  }
}

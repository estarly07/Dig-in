import 'package:bloc/bloc.dart';
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/categories/get_categories_use_case.dart';
import 'package:dig_in/domain/models/category_model.dart';
import 'package:dig_in/domain/models/food_model.dart';
import 'package:dig_in/domain/models/restaurant_model.dart';
import 'package:meta/meta.dart';

part 'home_categories_event.dart';
part 'home_categories_state.dart';

class HomeCategoriesBloc extends Bloc<HomeCategoriesEvent, HomeCategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  HomeCategoriesBloc(
    this._getCategoriesUseCase
  ) : super(HomeCategoriesInitialState()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(LoadingCategoriesState());
      final response = await _getCategoriesUseCase.getCategories();
      switch (response.runtimeType) {
        case SuccessResponse:
            emit(LoadedCategoriesState((response as SuccessResponse).data));
          break;
        case NullOrEmptyData:
            emit(LoadedCategoriesState([]));
          break;
        case ErrorResponseApi:
            emit(ErrorCategoriesState(message: (response as ErrorResponseApi).error.toString()));
          break;
      }
    });
  }
}

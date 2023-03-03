import 'package:bloc/bloc.dart';
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/food/get_most_popular_foods_use_case.dart';
import 'package:dig_in/domain/models/food_model.dart';
import 'package:meta/meta.dart';

part 'most_popular_foods_event.dart';
part 'most_popular_foods_state.dart';

class MostPopularFoodsBloc extends Bloc<MostPopularFoodsEvent, MostPopularFoodsState> {
  final GetMostPopularFoodsUseCase _getMostPopularFoodsUseCase;
  MostPopularFoodsBloc(
    this._getMostPopularFoodsUseCase
  ) : super(MostPopularFoodsInitial()) {
    on<GetMostPopularFoods>((event, emit) async{
      emit(LoadingMostPopularFoods());
      final response = await _getMostPopularFoodsUseCase.getMostPopularFoodsUseCase();
      switch (response.runtimeType) {
        case SuccessResponse:
            emit(LoadedMostPopularFoods((response as SuccessResponse).data));
          break;
        case NullOrEmptyData:
            emit(LoadedMostPopularFoods([]));
          break;
        case ErrorResponseApi:
            emit(ErrorMostPopularFoods((response as ErrorResponseApi).error.toString()));
          break;
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/models/restaurant_model.dart';
import 'package:dig_in/domain/restaurants/get_most_popular_restaurants_use_case.dart';
import 'package:meta/meta.dart';

part 'most_popular_restaurants_event.dart';
part 'most_pouplar_restaurants_state.dart';

class MostPopularRestaurantsBloc extends Bloc<MostPopularRestaurantsEvent, MostPopularRestaurantsState> {
  final GetMostPopularRestaurantsUseCase _getMostPopularRestaurantsUseCase;
  MostPopularRestaurantsBloc(this._getMostPopularRestaurantsUseCase) : super(MostPouplarRestaurantsInitial()) {
    on<GetRestaurantsEvent>((event, emit) async {
      emit(LoadingRestaurantsState());
      final response = await _getMostPopularRestaurantsUseCase.getMostPopularRestaurantsUseCase();
      switch (response.runtimeType) {
        case SuccessResponse:
            emit(LoadedRestaurantsState((response as SuccessResponse).data));
          break;
        case NullOrEmptyData:
            emit(LoadedRestaurantsState([]));
          break;
        case ErrorResponseApi:
            emit(LoadedRestaurantsState([]));
          break;
        case NoConnectionInternet:
            emit(LoadedRestaurantsState([]));
          break;
      }
    });
  }
}

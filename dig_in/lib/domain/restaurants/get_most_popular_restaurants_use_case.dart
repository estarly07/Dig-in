import 'package:dig_in/base/base_result_repository.dart' as repository;
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/models/restaurant_model.dart';
import 'package:dig_in/domain/restaurants/restaurant_repository.dart';

class GetMostPopularRestaurantsUseCase {
  final RestaurantRepository restaurantRepository;
  GetMostPopularRestaurantsUseCase(this.restaurantRepository);
  Future<BaseResultUseCase> getMostPopularRestaurantsUseCase() async {
    try {
      final response = await restaurantRepository.getRestaurants();
      switch (response.runtimeType) {
        case repository.SuccessResponse:
          return BaseResultUseCase.success(
            ((response as repository.SuccessResponse ).data as List<RestaurantModel>)
          );
        case repository.ErrorResponseApi:
          return BaseResultUseCase.errorApi((response as repository.ErrorResponseApi ).exception);
        case repository.NullOrEmptyData:
        default:
          return BaseResultUseCase.nullOrEmptyData();
      }
    } on Exception catch (e) {
      return BaseResultUseCase.errorApi(e);
    }
  }
}

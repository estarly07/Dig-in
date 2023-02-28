import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/response/restaurant_response.dart';
import 'package:dig_in/data/api/services/restaurants_service.dart';
import 'package:dig_in/domain/models/restaurant_model.dart';

class RestaurantRepository {
   Future<BaseResultRepository> getRestaurants() async {
    try {
      final response = await RestaurantsService().getRestaurants();
      if(response==null) {
        return BaseResultRepository.nullOrEmptyData();
      } else {
        final list = (response.data as List).map((e) => RestaurantResponse.toJson(e)).toList();
        return BaseResultRepository.success(list.map((e) => e.parse()).toList());
      }
    } on Exception catch (e) {
      return BaseResultRepository.errorApi(e);
    }
  }
}
extension RestaurantModelParsing on RestaurantResponse {
  RestaurantModel parse() {
    return RestaurantModel(idRestaurant, name, haveDelivery, rating, attentionTimeRange, address, views, image);
  }
}
import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/response/restaurant_response.dart';
import 'package:dig_in/presentation/models/restaurant_model.dart';

class RestaurantRepository {
   Future<BaseResultRepository> getRestaurants() async {
    try {
      return BaseResultRepository.success(
       [
      RestaurantResponse(
        1, 
        "name", 
        true, 
        4.5, 
        "10-15", 
        "address", 
        1, 
        "https://media.self.com/photos/622912847b959736301bfb91/2:1/w_2119,h_1059,c_limit/GettyImages-1301412050.jpg"),
      RestaurantResponse(
        2, 
        "name 2", 
        false, 
        4.1, 
        "30-45", 
        "address", 
        1, 
        "https://media-cdn.tripadvisor.com/media/photo-s/18/09/5f/2e/terrace.jpg")
      ].map((e) => e.parse()).toList());
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
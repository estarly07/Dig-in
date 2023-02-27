import 'package:dig_in/data/api/services/provide_dio.dart';
import 'package:dio/dio.dart';

class RestaurantsService extends ProvideDio {
  RestaurantsService._();
  static final RestaurantsService _restaurantsService = RestaurantsService._();
  factory RestaurantsService() => _restaurantsService;
  
  Future<Response?> getRestaurants() async =>await dio.get("restaurants.json");
}
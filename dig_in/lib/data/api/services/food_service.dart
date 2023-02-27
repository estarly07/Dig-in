import 'package:dig_in/data/api/services/provide_dio.dart';
import 'package:dio/dio.dart';

class FoodService extends ProvideDio{
  FoodService._();
  static final FoodService _foodService = FoodService._();
  factory FoodService() => _foodService;

  Future<Response?> getFood() async => await dio.get("foods.json");
}
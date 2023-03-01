
import 'package:dig_in/data/repositories/category_repository.dart';
import 'package:dig_in/data/repositories/food_repository.dart';
import 'package:dig_in/data/repositories/restaurant_repository.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => CategoryRepository(getIt()));
  getIt.registerFactory(() => FoodRepository(getIt()));
  getIt.registerFactory(() => RestaurantRepository(getIt()));
}
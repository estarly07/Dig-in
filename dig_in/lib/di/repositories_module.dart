
import 'package:dig_in/data/repositories/category_repository.dart';
import 'package:dig_in/data/repositories/food_repository.dart';
import 'package:dig_in/data/repositories/restaurant_repository.dart';
import 'package:dig_in/domain/categories/category_repository.dart';
import 'package:dig_in/domain/food/food_reposiroty.dart';
import 'package:dig_in/domain/restaurants/restaurant_repository.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(getIt()), );
  getIt.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(getIt()), );
  getIt.registerLazySingleton<RestaurantRepository>(() => RestaurantRepositoryImpl(getIt()), );
}
import 'package:dig_in/domain/categories/get_categories_use_case.dart';
import 'package:dig_in/domain/food/get_comments_foods_use_case.dart';
import 'package:dig_in/domain/food/get_most_popular_foods_use_case.dart';
import 'package:dig_in/domain/restaurants/get_most_popular_restaurants_use_case.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => GetCategoriesUseCase(getIt()));
  getIt.registerFactory(() => GetMostPopularFoodsUseCase(getIt()));
  getIt.registerFactory(() => GetMostPopularRestaurantsUseCase(getIt()));
  getIt.registerFactory(() => GetCommentsFoodUseCase(getIt()));
}
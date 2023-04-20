import 'package:dig_in/domain/categories/get_categories_use_case.dart';
import 'package:dig_in/domain/food/get_comments_foods_use_case.dart';
import 'package:dig_in/domain/food/get_most_popular_foods_use_case.dart';
import 'package:dig_in/domain/login/get_user_use_case.dart';
import 'package:dig_in/domain/login/login_by_email_password_user_case.dart';
import 'package:dig_in/domain/login/register_info_user_use_case.dart';
import 'package:dig_in/domain/login/register_user_by_email_and_password_use_case.dart';
import 'package:dig_in/domain/login/register_user_local_use_case.dart';
import 'package:dig_in/domain/restaurants/get_most_popular_restaurants_use_case.dart';
import 'package:get_it/get_it.dart';

import '../domain/login/login_by_google_use_case.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => GetCategoriesUseCase(getIt()));
  getIt.registerFactory(() => GetMostPopularFoodsUseCase(getIt()));
  getIt.registerFactory(() => GetMostPopularRestaurantsUseCase(getIt()));
  getIt.registerFactory(() => GetCommentsFoodUseCase(getIt()));
  getIt.registerFactory(() => LoginByEmailAndPasswordUseCase(getIt()));
  getIt.registerFactory(() => RegisterUserByEmailAndPasswordUseCase(getIt()));
  getIt.registerFactory(() => RegisterInfoUserUseCase(getIt()));
  getIt.registerFactory(() => RegisterUserLocalUseCase(getIt()));
  getIt.registerFactory(() => GetUserUseCase(getIt()));
  getIt.registerFactory(() => LoginByGoogleUseCase(getIt()));
}
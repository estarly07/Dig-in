import 'package:dig_in/data/api/database/database_service.dart';
import 'package:dig_in/data/api/firebase/login_service_firebase.dart';
import 'package:dig_in/data/api/services/CategoryService.dart';
import 'package:dig_in/data/api/services/food_service.dart';
import 'package:dig_in/data/api/services/restaurants_service.dart';
import 'package:dig_in/data/api/sharedpreferences/app_preferences.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => CategoryService());
  getIt.registerFactory(() => FoodService());
  getIt.registerFactory(() => RestaurantsService());
  getIt.registerFactory(() => LoginServiceFirebase());
  //BD
  getIt.registerFactory(() => DatabaseService(getIt()));
  //Sharedpreferences
  getIt.registerFactory(() => AppPreferences.get);
}
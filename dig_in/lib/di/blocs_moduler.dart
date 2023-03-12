
import 'package:dig_in/presentation/food/blocs/comments/comments_bloc.dart';
import 'package:dig_in/presentation/food/blocs/food/food_bloc.dart';
import 'package:dig_in/presentation/home/blocs/home_categories_bloc/home_categories_bloc.dart';
import 'package:dig_in/presentation/home/blocs/most_popular_foods/most_popular_foods_bloc.dart';
import 'package:dig_in/presentation/home/blocs/most_popular_restaurants/most_popular_restaurants_bloc.dart';
import 'package:dig_in/presentation/login/blocs/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => HomeCategoriesBloc(getIt()));
  getIt.registerFactory(() => MostPopularFoodsBloc(getIt()));
  getIt.registerFactory(() => MostPopularRestaurantsBloc(getIt()));
  getIt.registerFactory(() => FoodBloc());
  getIt.registerFactory(() => CommentsBloc(getIt()));
  getIt.registerFactory(() => LoginBloc(getIt()));
}
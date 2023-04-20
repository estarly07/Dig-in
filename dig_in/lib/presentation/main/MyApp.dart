import 'package:dig_in/data/api/sharedpreferences/app_preferences.dart';
import 'package:dig_in/di/di.dart';
import 'package:dig_in/presentation/food/blocs/comments/comments_bloc.dart';
import 'package:dig_in/presentation/food/blocs/food/food_bloc.dart';
import 'package:dig_in/presentation/home/blocs/home_categories_bloc/home_categories_bloc.dart';
import 'package:dig_in/presentation/home/blocs/most_popular_foods/most_popular_foods_bloc.dart';
import 'package:dig_in/presentation/home/blocs/most_popular_restaurants/most_popular_restaurants_bloc.dart';
import 'package:dig_in/presentation/login/blocs/bloc/login_bloc.dart';
import 'package:dig_in/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => getIt<HomeCategoriesBloc>(),),
        BlocProvider(create: (context) => getIt<MostPopularFoodsBloc>(),),
        BlocProvider(create: (context) => getIt<MostPopularRestaurantsBloc>(),),
        BlocProvider(create: (context) => getIt<FoodBloc>()),
        BlocProvider(create: (context) => getIt<CommentsBloc>()),
        BlocProvider(create: (context) => LoginBloc(
          navigatorKey.currentContext!,
          getIt(),getIt(),getIt(),getIt(),getIt(),getIt(),getIt())),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        routes: routes(),
        initialRoute: initialRoute(getIt<AppPreferences>().isLogin),
      ),
    );
  }
}
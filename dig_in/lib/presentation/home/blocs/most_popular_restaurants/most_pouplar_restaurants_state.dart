part of 'most_popular_restaurants_bloc.dart';

@immutable
abstract class MostPopularRestaurantsState {
  MostPopularRestaurantsState();

  factory MostPopularRestaurantsState.initial() => MostPouplarRestaurantsInitial();
  factory MostPopularRestaurantsState.loadingRestaurant() => LoadingRestaurantsState();
  factory MostPopularRestaurantsState.loadedRestaurant(
    List<RestaurantModel> restaurants
  ) => LoadedRestaurantsState(restaurants);
  factory MostPopularRestaurantsState.errorRestaurant(String message) => ErrorRestaurantsState(message);
}

class MostPouplarRestaurantsInitial extends MostPopularRestaurantsState {}
class LoadingRestaurantsState extends MostPopularRestaurantsState {}
class LoadedRestaurantsState extends MostPopularRestaurantsState {
  final List<RestaurantModel> restaurants;
  LoadedRestaurantsState(this.restaurants);
}
class ErrorRestaurantsState extends MostPopularRestaurantsState {
  final String message;
  ErrorRestaurantsState(this.message);
}

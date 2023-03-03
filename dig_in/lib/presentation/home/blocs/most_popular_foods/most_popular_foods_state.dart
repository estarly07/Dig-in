part of 'most_popular_foods_bloc.dart';

@immutable
abstract class MostPopularFoodsState {
  MostPopularFoodsState();
  factory MostPopularFoodsState.initial() => MostPopularFoodsInitial();
  factory MostPopularFoodsState.loadingMostPopularFoods() => LoadingMostPopularFoods();
  factory MostPopularFoodsState.loadedMostPopularFoods(
    List<FoodModel> mostPopularFoods
  ) => LoadedMostPopularFoods(mostPopularFoods);
  factory MostPopularFoodsState.errorMostPopularFoods(
    String message
  ) => ErrorMostPopularFoods(message);
}

class MostPopularFoodsInitial extends MostPopularFoodsState {}
class LoadingMostPopularFoods extends MostPopularFoodsState {}
class LoadedMostPopularFoods extends MostPopularFoodsState {
  final List<FoodModel> mostPopularFoods;
  LoadedMostPopularFoods(this.mostPopularFoods);
}
class ErrorMostPopularFoods extends MostPopularFoodsState {
  final String message;
  ErrorMostPopularFoods(this.message);
}

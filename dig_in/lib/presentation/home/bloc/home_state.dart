part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final List<CategoryModel> categories;
  final bool showWaitCategories;
  final List<FoodModel> foods;
  final bool showWaitFoods;
  final List<RestaurantModel> restaurants;
  final bool showWaitRestaurants;

  const HomeState(
      this.categories, this.showWaitCategories, this.foods, this.showWaitFoods, this.restaurants, this.showWaitRestaurants);
}

class HomeInitial extends HomeState {
  HomeInitial() : super([], false, [], false,[],false);
}

class ChangeDataState extends HomeState {
  const ChangeDataState(
    {
      required List<CategoryModel> categories,
      required bool showWaitCategories,
      required List<FoodModel> foods,
      required bool showWaitFoods,
      required List<RestaurantModel> restaurants,
      required bool showWaitRestaurants,
    })
    : super(categories, showWaitCategories, foods, showWaitFoods,restaurants,showWaitRestaurants);
}

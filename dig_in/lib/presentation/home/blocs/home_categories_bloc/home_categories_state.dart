part of 'home_categories_bloc.dart';

@immutable
abstract class HomeCategoriesState {
  HomeCategoriesState();
  factory HomeCategoriesState.initialCategories() => HomeCategoriesInitialState();
  factory HomeCategoriesState.loadingCategories() => LoadingCategoriesState();
  factory HomeCategoriesState.loadedCategories(
     {
      required List<CategoryModel>   categories,
      required List<FoodModel>       foods,
      required List<RestaurantModel> restaurants,
    }
  ) => LoadedCategoriesState(categories);
  factory HomeCategoriesState.errorHome(String message) => ErrorCategoriesState(message: message);
}

class HomeCategoriesInitialState extends HomeCategoriesState {}
class LoadingCategoriesState    extends HomeCategoriesState {}
class LoadedCategoriesState extends HomeCategoriesState {
  final List<CategoryModel> categories;
  LoadedCategoriesState(this.categories);
}
class ErrorCategoriesState extends HomeCategoriesState {
  final String message;

  ErrorCategoriesState({required this.message});
}
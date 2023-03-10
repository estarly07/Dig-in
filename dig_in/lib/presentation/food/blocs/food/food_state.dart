part of 'food_bloc.dart';

@immutable
abstract class FoodState {
  FoodState();
  factory FoodState.initial() => FoodInitial();
}

class FoodInitial extends FoodState {}
class LoadingFoodState extends FoodState {}
class LoadedFoodState extends FoodState {
  final int cant;
  final double rating;
  LoadedFoodState(this.cant, this.rating);
}
class ErrorFoodState extends FoodState {}


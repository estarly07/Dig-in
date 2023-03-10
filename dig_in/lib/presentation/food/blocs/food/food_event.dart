part of 'food_bloc.dart';

@immutable
abstract class FoodEvent {}

class GetDataFoodEvent extends FoodEvent{}
class AddCantProduct extends FoodEvent {}
class SubstractCantProduct extends FoodEvent {}
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}
class GetMostPupularFoodsEvent extends HomeEvent {}
class GetMostPupularRestaurantsEvent extends HomeEvent {}
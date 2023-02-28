import 'package:bloc/bloc.dart';
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/categories/get_categories_use_case.dart';
import 'package:dig_in/domain/food/get_most_popular_foods_use_case.dart';
import 'package:dig_in/domain/restaurants/get_most_popular_restaurants_use_case.dart';
import 'package:dig_in/domain/models/category_model.dart';
import 'package:dig_in/domain/models/food_model.dart';
import 'package:dig_in/domain/models/restaurant_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesUseCase getCategoriesUseCase = GetCategoriesUseCase();
  final GetMostPopularFoodsUseCase getMostPupularFoodsEvent = GetMostPopularFoodsUseCase();
  final GetMostPopularRestaurantsUseCase getMostPopularRestaurantsUseCase = GetMostPopularRestaurantsUseCase();

  HomeBloc() : super(HomeInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(ChangeDataState(
        categories : state.categories, 
        showWaitCategories : true,
        foods : state.foods,
        showWaitFoods : state.showWaitFoods,
        restaurants: state.restaurants,
        showWaitRestaurants: state.showWaitRestaurants
      ));
      final response = await getCategoriesUseCase.getCategories();
      switch (response.runtimeType) {
        case SuccessResponse:
             emit(ChangeDataState(
              categories :(response as SuccessResponse).data, 
              showWaitCategories : false,
              foods : state.foods,
              showWaitFoods : state.showWaitFoods,
              restaurants: state.restaurants,
              showWaitRestaurants: state.showWaitRestaurants
            ));
          break;
        default:
      }
    });
    on<GetMostPupularFoodsEvent>((event, emit) async {
      emit(ChangeDataState(
        categories : state.categories, 
        showWaitCategories : state.showWaitCategories,
        foods : state.foods,
        showWaitFoods : true,
        restaurants: state.restaurants,
        showWaitRestaurants: state.showWaitRestaurants
      ));
      final response = await getMostPupularFoodsEvent.getMostPopularFoodsUseCase();
      switch (response.runtimeType) {
        case SuccessResponse:
           emit(ChangeDataState(
            categories : state.categories, 
            showWaitCategories : state.showWaitCategories,
            foods : (response as SuccessResponse).data,
            showWaitFoods : false,
            restaurants: state.restaurants,
            showWaitRestaurants: state.showWaitRestaurants
          ));
          break;
        default:
      }
    });
    on<GetMostPupularRestaurantsEvent>((event, emit) async {
      emit(ChangeDataState(
        categories : state.categories, 
        showWaitCategories : state.showWaitCategories,
        foods : state.foods,
        showWaitFoods : state.showWaitFoods,
        restaurants: state.restaurants,
        showWaitRestaurants: true
      ));
      final response = await getMostPopularRestaurantsUseCase.getMostPopularRestaurantsUseCase();
      switch (response.runtimeType) {
        case SuccessResponse:
          emit(ChangeDataState(
            categories : state.categories, 
            showWaitCategories : state.showWaitCategories,
            foods : state.foods,
            showWaitFoods : state.showWaitFoods,
            restaurants: (response as SuccessResponse).data,
            showWaitRestaurants: false
          ));
          break;
        default:
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<GetDataFoodEvent>((event, emit) {
      emit(LoadingFoodState());
      emit(LoadedFoodState(1, 4.2));
    });
    on<AddCantProduct>((event, emit) {
      emit(LoadedFoodState((state as LoadedFoodState).cant + 1, (state as LoadedFoodState).rating));
    }); 
    on<SubstractCantProduct>((event, emit) {
      if((state as LoadedFoodState).cant > 1){
        emit(LoadedFoodState((state as LoadedFoodState).cant - 1, (state as LoadedFoodState).rating));
      }
    }); 
  }
}

import 'package:dig_in/base/base_result_repository.dart' as repository;
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/food/food_reposiroty.dart';

class GetMostPopularFoodsUseCase {
  final FoodRepository foodRepository;
  GetMostPopularFoodsUseCase(this.foodRepository);

  Future<BaseResultUseCase> getMostPopularFoodsUseCase() async {
    try {
      final response =await foodRepository.getFoods();
      switch(response.runtimeType){
        case repository.SuccessResponse:
          return BaseResultUseCase.success((response as repository.SuccessResponse).data);
        case repository.ErrorResponseApi:
          return BaseResultUseCase.errorApi((response as repository.ErrorResponseApi).exception);
        case repository.NullOrEmptyData:
        default:
           return BaseResultUseCase.nullOrEmptyData();
      }
    } on Exception catch (e) {
      return BaseResultUseCase.errorApi(e);
    }
  }
  
}
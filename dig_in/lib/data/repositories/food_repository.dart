import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/response/food_response.dart';
import 'package:dig_in/data/api/services/food_service.dart';
import 'package:dig_in/domain/models/food_model.dart';

class FoodRepository {
  Future<BaseResultRepository> getFoods() async {
    try {
      final response =await FoodService().getFood();
      if(response == null){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        final list = (response.data as List).map((e) => FoodResponse.fromJson(e)).toList();
        return BaseResultRepository.success(list.map((e) => e.parse()).toList());
      }
    } on Exception catch (e) {
      return BaseResultRepository.errorApi(e);
    }
  }
}

extension FoodModelParsing on FoodResponse {
  FoodModel parse() {
    return FoodModel(
        idFood, name, image, description, price, fkIdCategory, views);
  }
}

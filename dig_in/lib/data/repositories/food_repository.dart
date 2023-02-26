import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/response/food_response.dart';
import 'package:dig_in/presentation/models/food_model.dart';

class FoodRepository {
  Future<BaseResultRepository> getFoods() async {
    try {
      return BaseResultRepository.success([
        FoodResponse(
            0,
            "Hot dog",
            "https://www.vvsupremo.com/wp-content/uploads/2016/02/900X570_Mexican-Style-Hot-Dogs.jpg",
            "description",
            5.5,
            0,
            1),
        FoodResponse(
            0,
            "American recipes",
            "https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505",
            "description",
            5.5,
            0,
            1),
      ].map((e) => e.parse()).toList());
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

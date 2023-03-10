import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/response/comments_response.dart';
import 'package:dig_in/data/api/response/food_response.dart';
import 'package:dig_in/data/api/services/food_service.dart';
import 'package:dig_in/domain/food/food_reposiroty.dart';
import 'package:dig_in/domain/models/comment_model.dart';
import 'package:dig_in/domain/models/food_model.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodService foodService;
  FoodRepositoryImpl(this.foodService);

  @override
  Future<BaseResultRepository> getFoods() async {
    try {
      final response = await foodService.getFood();
      if (response == null || response.data == null) {
        return BaseResultRepository.nullOrEmptyData();
      } else {
        List<FoodResponse> foods = [];
        (response.data as Map<String, dynamic>).forEach((key, value) {
          foods.add(FoodResponse.fromJson(value));
        });
        return BaseResultRepository.success(
            foods.map((e) => e.parse()).toList());
      }
    } on Exception catch (e) {
      return BaseResultRepository.errorApi(e);
    }
  }

  @override
  Future<BaseResultRepository> getComments(String idFood) async {
    try {
      final response = await foodService.getComments(idFood);
      if (response == null || response.data == null) {
        return BaseResultRepository.nullOrEmptyData();
      } else {
        List<CommentsResponse> comments = [];
        (response.data as Map<String, dynamic>).forEach((key, value) {
          comments.add(CommentsResponse.fromJson(value));
        });
        return BaseResultRepository.success(
            comments.map((e) => e.parse()).toList());
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

extension CommentModelParsing on CommentsResponse {
  CommentModel parse() {
    return CommentModel(
      comment,
      idComment,
      rating,
      date,
      fkIdUser,
    );
  }
}

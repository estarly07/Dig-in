import 'package:dig_in/base/base_result_repository.dart' as repository;
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/domain/food/food_reposiroty.dart';

class GetCommentsFoodUseCase {
  final FoodRepository _foodRepository;
  GetCommentsFoodUseCase(this._foodRepository);

  Future<BaseResultUseCase> getCommentsFoodUseCase(String idFood ) async {
    try {
      final response = await _foodRepository.getComments(idFood);
      switch (response.runtimeType) {
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
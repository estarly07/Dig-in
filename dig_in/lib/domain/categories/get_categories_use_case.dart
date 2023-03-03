import 'package:dig_in/base/base_result_repository.dart' as repository;
import 'package:dig_in/base/base_result_use_case.dart';
import 'package:dig_in/data/repositories/category_repository.dart';
import 'package:dig_in/domain/models/category_model.dart';

class GetCategoriesUseCase {
  final CategoryRepository _categoryRepository;
  GetCategoriesUseCase(this._categoryRepository);

  Future<BaseResultUseCase>  getCategories() async {
    try {
      final response = await _categoryRepository.getCategories();
      switch (response.runtimeType) {
        case repository.SuccessResponse:
          return BaseResultUseCase.success(
            ((response as repository.SuccessResponse ).data as List<CategoryModel>)
          );
        case repository.ErrorResponseApi:
          return BaseResultUseCase.errorApi((response as repository.ErrorResponseApi ).exception);
        case repository.NullOrEmptyData:
        default:
          return BaseResultUseCase.nullOrEmptyData();
      }
    } on Exception catch (e) {
      return BaseResultUseCase.errorApi(e);
    }
  }
}

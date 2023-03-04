import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/base/base_result_use_case.dart' as usecase;
import 'package:dig_in/domain/categories/category_repository.dart';
import 'package:dig_in/domain/categories/get_categories_use_case.dart';
import 'package:dig_in/domain/models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_use_case_test.mocks.dart';

class CategoriesRepositoryTest extends Mock implements CategoryRepository{}

@GenerateMocks([CategoriesRepositoryTest])
void main() {
  late GetCategoriesUseCase _getCatgeoriesUseCase;
  late MockCategoriesRepositoryTest _categoryRepository;
  setUpAll((){
    _categoryRepository = MockCategoriesRepositoryTest();
    _getCatgeoriesUseCase = GetCategoriesUseCase(_categoryRepository);
  });
  group("Test get categories usecase", (){
    test('when the repository returns an array of categories a sucess should arrive', ()async  {
      final listResponse = [CategoryModel(idCategory: 1, image: "image", name: "name")];
      when(_categoryRepository.getCategories()).thenAnswer((_) async {
        return BaseResultRepository.success(listResponse);
      });
      final response =await _getCatgeoriesUseCase.getCategories();
      expect(response.runtimeType, usecase.SuccessResponse ,reason: "The repository did not return sucess" );
      expect((response as usecase.SuccessResponse).data,listResponse, reason: "the data is not the same as the one with which it was mocked");
    });

  });
}
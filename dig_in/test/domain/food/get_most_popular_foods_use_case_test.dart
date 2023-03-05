import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/base/base_result_use_case.dart' as usecase;
import 'package:dig_in/domain/food/food_reposiroty.dart';
import 'package:dig_in/domain/food/get_most_popular_foods_use_case.dart';
import 'package:dig_in/domain/models/food_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_most_popular_foods_use_case_test.mocks.dart';
class FoodRepositoryTest extends Mock implements FoodRepository {}

@GenerateMocks([FoodRepositoryTest])
void main() {
  late GetMostPopularFoodsUseCase getMostPopularFoodsUseCase;
  late MockFoodRepositoryTest mockFoodRepositoryTest;
  setUpAll((){
    mockFoodRepositoryTest = MockFoodRepositoryTest();
    getMostPopularFoodsUseCase = GetMostPopularFoodsUseCase(mockFoodRepositoryTest);
  });
  group("get most popular foods use case  test", (){
    test('When the repository returns success you should get a list of foodmodels', () async {
        final listResponse = [
          FoodModel(0, "", "", "", 0.0, 0, 1),
          FoodModel(0, "", "", "", 0.0, 0, 1),
          FoodModel(0, "", "", "", 0.0, 0, 1),
        ];
        when(mockFoodRepositoryTest.getFoods()).thenAnswer(
          (realInvocation)async => BaseResultRepository.success(listResponse)
        );

        final response = await getMostPopularFoodsUseCase.getMostPopularFoodsUseCase();

        expect(response.runtimeType, usecase.SuccessResponse, reason: "Expected a success but returned a ${response.runtimeType}");
        expect(
          (response as usecase.SuccessResponse).data, listResponse, 
          reason: "the data is not the same as expected");
    });
  });
}
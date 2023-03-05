import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/base/base_result_use_case.dart' as usecase;
import 'package:dig_in/domain/models/restaurant_model.dart';
import 'package:dig_in/domain/restaurants/get_most_popular_restaurants_use_case.dart';
import 'package:dig_in/domain/restaurants/restaurant_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_most_popular_restaurants_use_case_test.mocks.dart';
class RestaurantsRepositoryTest extends Mock implements RestaurantRepository {}

@GenerateMocks([RestaurantsRepositoryTest])
void main() {
  late MockRestaurantsRepositoryTest mockRestaurantsRepositoryTest;
  late GetMostPopularRestaurantsUseCase getMostPopularRestaurantsUseCase;
  setUpAll((){
    mockRestaurantsRepositoryTest = MockRestaurantsRepositoryTest();
    getMostPopularRestaurantsUseCase = GetMostPopularRestaurantsUseCase(mockRestaurantsRepositoryTest);
  });
  group("get most popular restaurants use case", 
  (){
    test('When the repository returns success you should get a list of RestaurantModels', () async {
        final listResponse = [
          RestaurantModel(0, "", false, 1.2, "", "", 1, ""),
          RestaurantModel(0, "", false, 1.2, "", "", 1, ""),
          RestaurantModel(0, "", false, 1.2, "", "", 1, ""),
        ];
        when(mockRestaurantsRepositoryTest.getRestaurants()).thenAnswer(
          (realInvocation) async => BaseResultRepository.success(listResponse)
        );
        final response = await getMostPopularRestaurantsUseCase.getMostPopularRestaurantsUseCase();

        expect(
          response.runtimeType, 
          usecase.SuccessResponse, 
          reason: "The result was expected to be succes and it was ${response.runtimeType}");
        expect((response as usecase.SuccessResponse).data, listResponse);
      });
  });
}
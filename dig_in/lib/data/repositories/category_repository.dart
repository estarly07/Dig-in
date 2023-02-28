import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/response/category_response.dart';
import 'package:dig_in/data/api/services/CategoryService.dart';
import 'package:dig_in/domain/models/category_model.dart';

class CategoryRepository {
  Future<BaseResultRepository> getCategories() async{
    try {
      final response = await CategoryService().getCategories();
      if(response==null){
        return BaseResultRepository.nullOrEmptyData();
      }else{
        final list = (response.data as List).map((e) => CategoryResponse.fromJson(e)).toList();
        return BaseResultRepository.success(list.map((e) => e.parse()).toList()
      );
      }
    } on Exception catch (e) {
      return BaseResultRepository.errorApi(e);
    }
  }
}
extension CategoryModelParsing on CategoryResponse {
  CategoryModel parse() {
    return CategoryModel(
      idCategory: idCategory, 
      image: image, 
      name: name
    );
  }
}
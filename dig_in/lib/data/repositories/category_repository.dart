import 'package:dig_in/base/base_result_repository.dart';
import 'package:dig_in/data/api/response/category_response.dart';
import 'package:dig_in/presentation/models/category_model.dart';

class CategoryRepository {
  Future<BaseResultRepository> getCategories() async{
    try {
      return BaseResultRepository.success(
        [
          CategoryResponse(idCategory: 0,image : "https://comboypizza.com/pereira/wp-content/uploads/sites/3/revslider/slider11.png",name: "Pizza"),
          CategoryResponse(idCategory: 1,image : "https://monsterburguer.com/wp-content/uploads/2022/10/burguer4.png",name: "Burger"),
          CategoryResponse(idCategory: 2,image : "https://sushilight.com/wp-content/uploads/2019/05/Ebi-tempura.png",name: "Sushi"),
        ].map((e) => e.parse()).toList()
      );
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
import 'package:dig_in/base/base_result_repository.dart';

abstract class CategoryRepository {
  Future<BaseResultRepository> getCategories();
}
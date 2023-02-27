import 'package:dig_in/data/api/services/provide_dio.dart';
import 'package:dio/dio.dart';

class CategoryService with ProvideDio{
  CategoryService._();
  factory CategoryService() => _categoryService;
  static final CategoryService _categoryService = CategoryService._();

  Future<Response?> getCategories()  async => await dio.get("/categories.json");
  
}
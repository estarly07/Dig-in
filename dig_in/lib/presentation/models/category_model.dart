class CategoryModel {
  final int idCategory;
  final String image;
  final String name;

  CategoryModel({
    required this.idCategory,
    required this.image,
    required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json, int datarutasId) => CategoryModel(
       idCategory : json["idCategory"],
       image      : json["image"],
       name       : json["name"],
    );
}
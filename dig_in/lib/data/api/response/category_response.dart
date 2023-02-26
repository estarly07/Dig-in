class CategoryResponse {
  final int idCategory;
  final String image;
  final String name;

  CategoryResponse({
    required this.idCategory,
    required this.image,
    required this.name});

  factory CategoryResponse.fromJson(Map<String, dynamic> json, int datarutasId) => CategoryResponse(
       idCategory : json["idCategory"],
       image      : json["image"],
       name       : json["name"],
    );
}
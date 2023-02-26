class FoodModel {
  final int idFood;
  final String name;
  final String image;
  final String description;
  final double price;
  final int fkIdCategory;
  final int views;

  FoodModel(this.idFood, this.name, this.image, this.description, this.price, this.fkIdCategory, this.views);
  
  factory FoodModel.fromJson(Map<String, dynamic> json, int datarutasId) => FoodModel(
    json["idFood"], 
    json["name"], 
    json["image"], 
    json["description"], 
    json["price"], 
    json["fkIdCategory"],
    json["views"],
  );
}
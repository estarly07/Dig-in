class FoodResponse {
  final int idFood;
  final String name;
  final String image;
  final String description;
  final double price;
  final int fkIdCategory;
  final int views;

  FoodResponse(this.idFood, this.name, this.image, this.description, this.price, this.fkIdCategory, this.views);
  
  factory FoodResponse.fromJson(Map<String, dynamic> json, int datarutasId) => FoodResponse(
    json["idFood"], 
    json["name"], 
    json["image"], 
    json["description"], 
    json["price"], 
    json["fkIdCategory"],
    json["views"],
  );
}
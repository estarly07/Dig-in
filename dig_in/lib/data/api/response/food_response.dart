class FoodResponse {
  final String idFood;
  final String name;
  final String image;
  final String description;
  final double price;
  final int fkIdCategory;
  final int views;
  final int fkIdRestaurant;

  FoodResponse(this.idFood, this.name, this.image, this.description, this.price, this.fkIdCategory, this.views, this.fkIdRestaurant);
  
  factory FoodResponse.fromJson(Map<String, dynamic> json) => FoodResponse(
    json["idFood"], 
    json["name"], 
    json["image"], 
    json["description"], 
    json["price"], 
    json["fkIdCategory"],
    json["views"],
    json["fkIdRestaurant"],
  );
}
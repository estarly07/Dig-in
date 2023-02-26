class FoodModel {
  final int idFood;
  final String name;
  final String image;
  final String description;
  final double price;
  final int fkIdCategory;
  final int views;

  FoodModel(this.idFood, this.name, this.image, this.description, this.price, this.fkIdCategory, this.views);
}
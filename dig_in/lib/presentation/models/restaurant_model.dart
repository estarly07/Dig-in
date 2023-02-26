import 'dart:ffi';

class RestaurantModel {
  final int idRestaurant;
  final String name;
  final String image;
  final bool haveDelivery;
  final double rating;
  final String attentionTimeRange;
  final String address;
  final int views;

  RestaurantModel(this.idRestaurant, this.name, this.haveDelivery, this.rating,
      this.attentionTimeRange, this.address, this.views, this.image);

  factory RestaurantModel.toJson(Map<String, dynamic> json) => RestaurantModel(
      json["idRestaurant"], 
      json["name"], 
      json["haveDelivery"], 
      json["rating"], 
      json["attentionTimeRange"], 
      json["address"],
      json["views"],
      json["image"],
    );
}

import 'package:dig_in/data/api/response/food_response.dart';

class RestaurantResponse {
  final int idRestaurant;
  final String name;
  final String image;
  final bool haveDelivery;
  final double rating;
  final String attentionTimeRange;
  final String address;
  final int views;

  RestaurantResponse(this.idRestaurant, this.name, this.haveDelivery, this.rating,
      this.attentionTimeRange, this.address, this.views, this.image);

  factory RestaurantResponse.toJson(Map<String, dynamic> json) => RestaurantResponse(
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
import 'package:dig_in/presentation/global/widgets/custom_card.dart';
import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:dig_in/presentation/home/ui/widgets/widget.dart';
import 'package:dig_in/presentation/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class MostPopularRestaurants extends StatelessWidget {
  MostPopularRestaurants({Key? key}) : super(key: key);

final list = [
  RestaurantModel(
    1, 
    "name", 
    true, 
    4.5, 
    "10-15", 
    "address", 
    1, 
    "https://media.self.com/photos/622912847b959736301bfb91/2:1/w_2119,h_1059,c_limit/GettyImages-1301412050.jpg"),
  RestaurantModel(
    2, 
    "name 2", 
    false, 
    4.1, 
    "30-45", 
    "address", 
    1, 
    "https://media-cdn.tripadvisor.com/media/photo-s/18/09/5f/2e/terrace.jpg")
];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
        itemCount: list.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _itemRestaurant(
          width: size.width * 0.9,
          corners: size.height * 0.02,
          margin: size.width * 0.05,
          restaurantModel: list[index],
        ),
      ),
    );
  }
}

class _itemRestaurant extends StatelessWidget {
  final double width;
  final double corners;
  final double margin;
  final RestaurantModel restaurantModel;
  const _itemRestaurant(
      {Key? key,
      required this.width,
      required this.corners,
      required this.margin,
      required this.restaurantModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      width: width,
      child: CustomCard(
          widget: Column(
            children: [
              Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(corners),
                  child: FadeInImage(
                    width: width,
                    placeholder: const AssetImage("assets/images/no_image.jpg"),
                    fadeOutDuration: const Duration(seconds: 1),
                    image: NetworkImage(restaurantModel.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(margin*0.6),
                  child: _AboutRestaurant(restaurant: restaurantModel,),
                ),
              )
            ],
          ),
          shadowColor: Colors.black,
          elevation: 5,
          backgroundColor: Colors.white,
          cornerRadius: corners),
    );
  }
}

class _AboutRestaurant extends StatelessWidget {
  final RestaurantModel restaurant;
  const _AboutRestaurant({
    Key? key,required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: restaurant.name,
              textColor: Colors.black,
              fontSize: 17,
              withBold: true,
            ),
            CustomIconText(
              text: "${restaurant.rating}",
              textColor: Colors.black,
              fontSize: 15,
              withBold: true,
              icon: Icons.star,
              colorIcon: Colors.orange.shade900,
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            restaurant.haveDelivery? CustomIconText(
              text: "Free delivery",
              textColor: Colors.black,
              fontSize: 13,
              icon: Icons.star,
              colorIcon: Colors.yellow.shade900,
            ): Container(),
            const SizedBox(width: 10,),
            CustomIconText(
              text: "${restaurant.attentionTimeRange} mins",
              textColor: Colors.black,
              fontSize: 13,
              icon: Icons.timelapse_sharp,
              colorIcon: Colors.yellow.shade900,
            ),
          ],
        ),
      ],
    );
  }
}

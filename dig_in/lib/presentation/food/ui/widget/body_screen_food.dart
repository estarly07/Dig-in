
import 'package:dig_in/domain/models/food_model.dart';
import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key, required this.size, required this.food,
  }) : super(key: key);
  final Size size;
  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.02,),
        CustomText(
          text: food.name, 
          textColor: Colors.black, 
          fontSize: 25,
          withBold: true,
        ),
        SizedBox(height: size.height * 0.02,),
        CustomText(
          maxLines: null,
          withOverflow: false,
          textAlign: TextAlign.justify,
          text: food.description, textColor: Colors.grey, fontSize: 15),
        SizedBox(height: size.height * 0.02,),
        CustomText(
                text: "Comment", 
                textColor: Colors.black, 
                fontSize: 25,
                withBold: true,
              ),
        SizedBox(height: size.height * 0.02,),
      ],
    );
  }
}


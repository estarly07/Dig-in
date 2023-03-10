
import 'package:dig_in/domain/models/food_model.dart';
import 'package:dig_in/presentation/food/ui/screen/food_screen.dart';
import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key, required this.size, required this.food, required this.showTitleComments,
  }) : super(key: key);
  final Size size;
  final FoodModel food;
  final bool showTitleComments;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.05,),
        CustomText(
          text: food.name, 
          textColor: Colors.black, 
          fontSize: 25,
          withBold: true,
        ),
        CustomButtonAddOrSubstractCant(
                  size: size,
                  color: Colors.orange.shade900,
                  contentColor: Colors.orange.shade900,
                  count:FoodScreenProvider.of(context).count,
                  onAdd: FoodScreenProvider.of(context).onAdd,
                  onSubstract: FoodScreenProvider.of(context).onSubstract,
                ),
        SizedBox(height: size.height * 0.02,),
        CustomText(
          maxLines: null,
          withOverflow: false,
          textAlign: TextAlign.justify,
          text: food.description, textColor: Colors.grey, fontSize: 15),
        SizedBox(height: size.height * 0.02,),
        showTitleComments?
        CustomText(
                text: "Comment", 
                textColor: Colors.black, 
                fontSize: 25,
                withBold: true,
              ) : Container(),
        SizedBox(height: size.height * 0.02,),
      ],
    );
  }
}


import 'package:dig_in/domain/models/food_model.dart';
import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class MostPopularFoods extends StatelessWidget {
  final List<FoodModel> foods;
  final bool wait;
  const MostPopularFoods({Key? key,required this.foods,required this.wait}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return wait? 
      GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,mainAxisSpacing: size.height * 0.025
          ),
          itemCount: 8,
          itemBuilder: (BuildContext ctx, index) {
            return _ItemFoodWait(radius: size.width * 0.15,); 
          })
      :GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,mainAxisSpacing: size.height * 0.025
          ),
          itemCount: foods.length,
          itemBuilder: (BuildContext ctx, index) {
            return _ItemFood(radius: size.width * 0.15, food: foods[index]);
          });
  }
}

class _ItemFood extends StatelessWidget {
  final double radius;
  final FoodModel food;

  const _ItemFood({
    Key? key,
    required this.radius,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: FadeInImage(
              placeholder: const AssetImage("assets/images/no_image.jpg"),
              fadeOutDuration: const Duration(seconds: 1),
              image: NetworkImage(food.image),
              fit: BoxFit.cover,
              height: radius,
              width: radius,
            ),
        ),
        const SizedBox(height: 10,),
        CustomText(
          text: food.name,
          withBold: true,
          textColor: Colors.black, 
          fontSize: 13,)
      ],
    );
  }
}
class _ItemFoodWait extends StatelessWidget {
  final double radius;

  const _ItemFoodWait({
    Key? key,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBackgroundWait(
            widget: SizedBox(width: radius,height: radius,), 
            corners: radius,
            margin: EdgeInsets.zero,
        ),
        const SizedBox(height: 10,),
        CustomBackgroundWait(
            widget: SizedBox(
              width: double.infinity,
              height: 13,
            ), 
            corners: 13,
            margin: EdgeInsets.zero
        )
      ],
    );
  }
}

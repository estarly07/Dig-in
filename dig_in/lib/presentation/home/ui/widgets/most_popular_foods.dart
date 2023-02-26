import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:dig_in/presentation/models/food_model.dart';
import 'package:flutter/material.dart';

class MostPopularFoods extends StatelessWidget {
  MostPopularFoods({Key? key}) : super(key: key);
  final list = [
    FoodModel(
        0,
        "Hot dog",
        "https://www.vvsupremo.com/wp-content/uploads/2016/02/900X570_Mexican-Style-Hot-Dogs.jpg",
        "description",
        5.5,
        0,
        1),
    FoodModel(
        0,
        "American recipes",
        "https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505",
        "description",
        5.5,
        0,
        1),
    
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,mainAxisSpacing: size.height * 0.025
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext ctx, index) {
          return _ItemFood(radius: size.width * 0.15, food: list[index]);
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

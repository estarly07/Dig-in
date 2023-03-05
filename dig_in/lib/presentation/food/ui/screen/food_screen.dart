import 'package:dig_in/domain/models/food_model.dart';
import 'package:dig_in/presentation/food/ui/widget/widget_screen_food.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    FoodModel food = ModalRoute.of(context)!.settings.arguments as FoodModel;
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            padding:const EdgeInsets.all(0),
            itemCount: 10+1,
            itemBuilder: ((context, index){
              if(index==0){
                return Column(
                  children: [
                    Header(
                      size: size,
                      imageFood: food.image,
                      idHero: food.idFood,
                      onBack : (){
                        Navigator.pop(context);
                      }
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Body(
                        size: size,
                        food: food
                      ),
                    ),
                  ],
                );
              }else{
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Comment(size: size,));
              }
            }),
          ),
          Positioned(
            bottom: size.height * 0.01,
            left: 0,
            right: 0,
            child: ButtonAddProduct(size: size),
          )
        ],
      )
    );
  }
}

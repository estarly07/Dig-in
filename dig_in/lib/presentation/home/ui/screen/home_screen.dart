import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:dig_in/presentation/home/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.025,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: const Header(),
              ),
              SizedBox(height: size.height*0.025,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: const CustomText(
                    text: "What would you\nlike to eat?",
                    withBold: true,
                    maxLines: 2,
                    textColor: Colors.black,
                    fontSize: 25),
              ),
              SizedBox(height: size.height*0.015,),
              Categories(),
              SizedBox(height: size.height*0.025,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: const CustomText(
                  text: "Most popular", 
                  withBold: true,
                  textColor: Colors.black, 
                  fontSize: 12,
                ),
              ),
              SizedBox(height: size.height*0.025,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: MostPopularFoods(),
              ),
              SizedBox(height: size.height*0.025,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: const CustomText(
                  text: "Popular restaurants", 
                  textColor: Colors.black, 
                  withBold: true,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: size.height*0.025,),
              MostPopularRestaurants(),
            ],
          ),
        ),
      ),
    );
  }
}

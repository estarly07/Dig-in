import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:dig_in/presentation/home/bloc/home_bloc.dart';
import 'package:dig_in/presentation/home/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context,listen: false).add(GetCategoriesEvent());
    BlocProvider.of<HomeBloc>(context,listen: false).add(GetMostPupularFoodsEvent());
    BlocProvider.of<HomeBloc>(context,listen: false).add(GetMostPupularRestaurantsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) =>
            Column(
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
                Categories(categories: state.categories),
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
                  child: MostPopularFoods(foods: state.foods,),
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
                MostPopularRestaurants(restaurants: state.restaurants),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

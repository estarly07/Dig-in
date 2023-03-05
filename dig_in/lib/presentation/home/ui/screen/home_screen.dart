import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:dig_in/presentation/home/blocs/home_categories_bloc/home_categories_bloc.dart';
import 'package:dig_in/presentation/home/blocs/most_popular_foods/most_popular_foods_bloc.dart';
import 'package:dig_in/presentation/home/blocs/most_popular_restaurants/most_popular_restaurants_bloc.dart';
import 'package:dig_in/presentation/home/ui/widgets/widget.dart';
import 'package:dig_in/presentation/routes.dart';
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
    context.read<HomeCategoriesBloc>().add(GetCategoriesEvent());
    context.read<MostPopularFoodsBloc>().add(GetMostPopularFoods());
    context.read<MostPopularRestaurantsBloc>().add(GetRestaurantsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: _Body(size: size),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.025,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: const Header(),
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: const CustomText(
              text: "What would you\nlike to eat?",
              withBold: true,
              maxLines: 2,
              textColor: Colors.black,
              fontSize: 25),
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        BlocBuilder<HomeCategoriesBloc, HomeCategoriesState>(
          builder: (context, state) {
            return Categories(
                categories:
                    state is LoadedCategoriesState ? state.categories : [],
                wait: state is LoadingCategoriesState?);
          },
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: const CustomText(
            text: "Most popular",
            withBold: true,
            textColor: Colors.black,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        BlocBuilder<MostPopularFoodsBloc, MostPopularFoodsState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: MostPopularFoods(
                  onTap : (foodModel) => Screens.navigationTo(context: context, page: Screens.food,arguments: foodModel),
                  foods: state is LoadedMostPopularFoods
                      ? (state).mostPopularFoods
                      : [],
                  wait: state is LoadingMostPopularFoods),
            );
          },
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: const CustomText(
            text: "Popular restaurants",
            textColor: Colors.black,
            withBold: true,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        BlocBuilder<MostPopularRestaurantsBloc, MostPopularRestaurantsState>(
          builder: (context, state) {
            return MostPopularRestaurants(
              restaurants: state is LoadedRestaurantsState? state.restaurants : [],
              wait : state is LoadingRestaurantsState

            );
          },
        ),
      ],
    );
  }
}

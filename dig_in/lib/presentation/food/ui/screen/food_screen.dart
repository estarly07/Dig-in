import 'package:dig_in/domain/models/food_model.dart';
import 'package:dig_in/presentation/food/blocs/comments/comments_bloc.dart';
import 'package:dig_in/presentation/food/blocs/food/food_bloc.dart';
import 'package:dig_in/presentation/food/ui/widget/widget_screen_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late FoodModel food;
 
  @override
  void didChangeDependencies() {
    context.read<FoodBloc>().add(GetDataFoodEvent());
    food= ModalRoute.of(context)!.settings.arguments as FoodModel;
    context.read<CommentsBloc>().add(GetCommentsEvent(food.idFood));
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        return BlocBuilder<CommentsBloc, CommentsState>(
          builder: (_, stateComment) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: stateComment is LoadedCommenstState? stateComment.comments.length + 1 : 1,
                    itemBuilder: ((context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Header(
                                size: size,
                                imageFood: food.image,
                                idHero: food.idFood,
                                onBack: () {
                                  Navigator.pop(context);
                                }),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              child:  FoodScreenProvider(
                                count: (state is LoadedFoodState)? (state).cant : 1,
                                onAdd: () =>
                                    context.read<FoodBloc>().add(AddCantProduct()),
                                onSubstract: () => context
                                    .read<FoodBloc>()
                                    .add(SubstractCantProduct()),
                                child: Body(
                                  size: size, 
                                  food: food, 
                                  showTitleComments :  stateComment is LoadedCommenstState? stateComment.comments.isNotEmpty  : false,),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: Comment(
                              size: size,
                              comment : (stateComment as LoadedCommenstState).comments[index-1]
                            ));
                      }
                    }),
                  ),
                ),
                !(state is LoadedFoodState)
                    ? CircularProgressIndicator(
                        color: Colors.orange.shade900,
                      )
                    : ButtonAddProduct(size: size),
              ],
            );
          },
        );
      },
    ));
  }
}

class FoodScreenProvider extends InheritedWidget {
  final int count;
  final Function onAdd;
  final Function onSubstract;

  FoodScreenProvider({
    Key? key,
    required this.count,
    required Widget child,
    required this.onAdd,
    required this.onSubstract,
  }) : super(key: key, child: child);
  @override
  bool updateShouldNotify(FoodScreenProvider oldWidget) {
    return true;
  }

  static FoodScreenProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FoodScreenProvider>()!;
  }
}

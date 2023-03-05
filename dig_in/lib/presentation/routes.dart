import 'package:dig_in/presentation/screens.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder> routes(){
  return  <String,WidgetBuilder>{
    Screens.home :(context) => const HomeScreen(),
    Screens.food :(context) => const FoodScreen()
  };
}

String initialRoute(bool isSing){
  return isSing? Screens.home : "";
}

class Screens {
  //Pages
  static const String home = "Home";
  static const String food = "food";

  static navigationTo({
    required BuildContext context,
    required String       page,
    Object? arguments
  }) => Navigator.pushNamed(context, page, arguments: arguments);
}
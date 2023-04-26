import 'package:dig_in/presentation/screens.dart';
import 'package:flutter/cupertino.dart';

import 'main/page/main_screen.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    Screens.main: (context) => const MainScreen(),
    Screens.food: (context) => const FoodScreen(),
    Screens.home: (context) => const HomeScreen(),
  };
}

String initialRoute(bool isSing) {
  return isSing ? Screens.main : "";
}

class Screens {
  //Pages
  static const String main = "main";
  static const String home = "home";
  static const String food = "food";

  static navigationTo(
          {required BuildContext context,
          required String page,
          Object? arguments}) =>
      Navigator.pushNamed(context, page, arguments: arguments);
}

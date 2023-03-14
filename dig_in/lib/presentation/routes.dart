
import 'package:dig_in/presentation/login/ui/screen/login_screen.dart';
import 'package:dig_in/presentation/screens.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder> routes(){
  return  <String,WidgetBuilder>{
    Screens.home :(context) => const HomeScreen(),
    Screens.food :(context) => const FoodScreen(),
    Screens.login:(context) => const LoginScreen()
  };
}

String initialRoute(bool isSing){
  return isSing? Screens.home : Screens.login;
}

class Screens {
  //Pages
  static const String home = "Home";
  static const String food = "food";
  static const String login= "login";

  static navigationTo({
    required BuildContext context,
    required String       page,
    bool    onBack = true,
    Object? arguments, 
  }) => 
  onBack?
    Navigator.pushNamed(context, page, arguments: arguments):
    Navigator.pushReplacementNamed(context, page);
}
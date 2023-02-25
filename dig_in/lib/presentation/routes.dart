import 'package:flutter/cupertino.dart';
import 'package:dig_in/presentation/screens.dart';

Map<String,WidgetBuilder> routes(){
  return  <String,WidgetBuilder>{
    _Screens.home :(context) => const HomeScreen()
  };
}

String initialRoute(bool isSing){
  return isSing? _Screens.home : "";
}

class _Screens {
  //Pages
  static const String home = "Home";
}
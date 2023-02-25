import 'package:dig_in/presentation/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes(),
      initialRoute: initialRoute(true),
    );
  }
}
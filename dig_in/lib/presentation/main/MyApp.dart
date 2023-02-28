import 'package:dig_in/presentation/home/bloc/home_bloc.dart';
import 'package:dig_in/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => HomeBloc(),),
      ],
      child: MaterialApp(
        routes: routes(),
        initialRoute: initialRoute(true),
      ),
    );
  }
}
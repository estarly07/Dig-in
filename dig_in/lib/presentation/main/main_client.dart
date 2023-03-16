import 'package:dig_in/data/api/sharedpreferences/app_preferences.dart';
import 'package:dig_in/di/di.dart' as di;
import 'package:dig_in/presentation/main/MyApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.CLIENT;//init flavor client
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();//init dependencies
  await di.getIt<AppPreferences>().initPreferences();//init preferences
  runApp(MyApp());
}

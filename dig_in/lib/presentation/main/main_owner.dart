import 'package:dig_in/di/di.dart' as di;
import 'package:dig_in/presentation/main/MyApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.OWNER; //init flavor owner
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init(); //init dependencies
  runApp(const MyApp());
}

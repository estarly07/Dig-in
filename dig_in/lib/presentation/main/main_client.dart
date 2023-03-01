import 'package:dig_in/di/di.dart' as di;
import 'package:dig_in/presentation/main/MyApp.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.CLIENT;//init flavor client
  di.init();//init dependencies
  runApp(const MyApp());
}

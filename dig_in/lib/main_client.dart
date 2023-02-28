import 'package:dig_in/MyApp.dart';
import 'package:flutter/material.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.CLIENT;
  runApp(MyApp());
}

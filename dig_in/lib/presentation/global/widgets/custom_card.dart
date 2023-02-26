import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget widget;
  final Color  shadowColor;
  final double elevation;
  final Color  backgroundColor;
  final double cornerRadius;
  const CustomCard(
    {Key? key,
    required this.widget,
    required this.shadowColor,
    required this.elevation,
    required this.backgroundColor,
    required this.cornerRadius}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: shadowColor,
        child: widget,
        elevation: elevation,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ));
  }
}

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool withBold;
  final Color textColor;
  final double fontSize;
  final int maxLines;

  const CustomText(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      this.withBold = false,
      this.maxLines = 1,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: withBold? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

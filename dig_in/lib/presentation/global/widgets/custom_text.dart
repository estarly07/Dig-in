import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool withBold;
  final Color textColor;
  final double fontSize;
  final int? maxLines;
  final bool withOverflow;
  final TextAlign textAlign;

  const CustomText(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      this.withBold = false,
      this.maxLines = 1,
      this.withOverflow = true,
      this.textAlign = TextAlign.start
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: withOverflow? TextOverflow.ellipsis : null,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: withBold? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

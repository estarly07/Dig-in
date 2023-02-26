import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomIconText extends StatelessWidget {
  final String text;
  final bool withBold;
  final Color textColor;
  final double fontSize;
  final IconData? icon;
  final int maxLines;
  final Color colorIcon;
  final bool leftIcon;
  final MainAxisAlignment mainAxisAlignment;

  const CustomIconText(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.withBold = false,
      this.leftIcon = true,
      this.maxLines = 1,
      this.icon,
      this.colorIcon = Colors.black,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.max,
      children: [
        leftIcon && icon!=null? Icon(icon,color: colorIcon,size: fontSize,): Container(),
        CustomText(
          text: text, 
           maxLines: maxLines,
          textColor: textColor, 
          fontSize: fontSize,
          withBold :withBold
        ),
        !leftIcon && icon!=null? Icon(icon,color: colorIcon,size: fontSize): Container(),
      ],
    );
  }
}

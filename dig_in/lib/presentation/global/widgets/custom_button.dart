import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Function onTap;
  final String text;
  final bool wait;

  const CustomButton(
    {Key? key, 
    required this.color, 
    required this.textColor, 
    required this.onTap, 
    required this.text, 
    this.wait = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return wait?
      Center(child: CircularProgressIndicator(color:Colors.orange.shade900)):
      InkWell(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.02,horizontal: size.width * 0.1),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size.height)
          ),
          child: Center(child: CustomText(text: text, textColor: textColor, fontSize: 15,withBold: true,)),
        )
      );
  }
}
import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textType;
  final String hintText;
  final bool isPassword;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String error;
  final Color textColor;
  const CustomTextField({
    Key? key,
    required this.textType,
    required this.controller,
    required this.hintText,
    required this.textColor,
    this.error = "",
    this.isPassword = false, 
    this.suffixIcon,
    this.prefixIcon, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: error.isEmpty? textColor: Colors.red),
            borderRadius: BorderRadius.circular(size.height)
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: textType,
            textInputAction: TextInputAction.done,
            autofocus: false,
            style: TextStyle(
              color: textColor, 
            ),
            cursorColor: textColor,
            maxLines: textType == TextInputType.multiline ? null : 1,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              border: InputBorder.none,
            ),
          ),
        ),
        error.isNotEmpty ? 
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: CustomText(text: error, textColor: Colors.red, fontSize: 15),
          ) :
          Container()
      ],
    );
  }
}

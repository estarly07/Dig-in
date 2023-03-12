import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textType;
  final String hintText;
  final bool isPassword;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final Color textColor;
  const CustomTextField({
    Key? key,
    required this.textType,
    required this.controller,
    required this.hintText,
    required this.textColor,
    this.isPassword = false, 
    this.suffixIcon,
    this.prefixIcon, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: textColor),
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
    );
  }
}

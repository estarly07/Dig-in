import 'package:dig_in/presentation/global/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtonAddOrSubstractCant extends StatelessWidget {
  final Color color;
  final Color contentColor;
  final int count;
  final Function onAdd;
  final Function onSubstract;

  const CustomButtonAddOrSubstractCant({
    Key? key,
    required this.size, 
    required this.color, 
    required this.contentColor, 
    required this.count, 
    required this.onAdd, 
    required this.onSubstract
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      height: size.height * 0.04,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: color,width: 1),
        borderRadius: BorderRadius.circular(size.height),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: ()=> onAdd(),
            child: Icon(Icons.add, color: contentColor,)),
          CustomText(text: "$count", textColor: contentColor, fontSize: 15),
          InkWell(
            onTap: ()=> onSubstract(),
            child: Icon(Icons.remove ,color: contentColor,))
        ],
      ),
    );
  }
}
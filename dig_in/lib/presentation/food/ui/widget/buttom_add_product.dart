
import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class ButtonAddProduct extends StatelessWidget {
  const ButtonAddProduct({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Row(
              children: [
                CustomText(
                  text: "\$35.78", 
                  withBold: true,
                  withOverflow: true,
                  textColor: Colors.white,
                  fontSize: 20),
                Spacer(),
                ButtonAddOrSubstractCant(
                  size: size,
                  color: Colors.white,
                  count: 1,
                  onAdd: (){},
                  onSubstract: (){},
                ),
                SizedBox(width: size.width * 0.02,),
                CustomCard(
                  widget: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.production_quantity_limits),
                  ), 
                  shadowColor: Colors.transparent, 
                  elevation: 0, 
                  backgroundColor: Colors.white, 
                  cornerRadius: 5
                )
              ],
            ),
          )
        ],
      ), 
      shadowColor: Colors.grey, 
      elevation: 13, 
      backgroundColor: Colors.orange.shade900, 
      cornerRadius: size.height
    );
  }
}

class ButtonAddOrSubstractCant extends StatelessWidget {
  final Color color;
  final int count;
  final Function onAdd;
  final Function onSubstract;

  const ButtonAddOrSubstractCant({
    Key? key,
    required this.size, 
    required this.color, 
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
      height: size.height * 0.06,
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
            child: Icon(Icons.add, color: color,)),
          CustomText(text: "$count", textColor: color, fontSize: 15),
          InkWell(
            onTap: ()=> onSubstract(),
            child: Icon(Icons.remove ,color: color,))
        ],
      ),
    );
  }
}

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
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1,vertical: size.height * 0.01),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Total Price", 
                      withOverflow: true,
                      textColor: Colors.white,
                      fontSize: 12),
                    CustomText(
                      text: "\$35.78", 
                      withBold: true,
                      withOverflow: true,
                      textColor: Colors.white,
                      fontSize: 20),
                  ],
                ),
                Spacer(),
                
                SizedBox(width: size.width * 0.02,),
                CustomCard(
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(vertical :8.0, horizontal: 15),
                    child: CustomText(
                        text: "Add to cart", 
                        withBold: true,
                        withOverflow: true,
                        textColor: Colors.orange.shade900,
                        fontSize: 15),
                  ), 
                  shadowColor: Colors.transparent, 
                  elevation: 0, 
                  backgroundColor: Colors.white, 
                  cornerRadius: size.height
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


import 'package:flutter/material.dart';

import '../../../global/widgets/custom_text.dart';

class LineWithOr extends StatelessWidget {
  final Color color;
  const LineWithOr({ Key? key, required this.color,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            height: 1,
            color: color,
          ),
        ),
        Flexible(
          child: Container(
            padding   : EdgeInsets.all(5),
            margin    : EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              shape   : BoxShape.circle,
              color   : color,
            ),
            child: CustomText(text: "Or", textColor: Colors.white, fontSize: 15),
          ),
        ),
        Flexible(
          child: Container(
            height: 1,
            color : color,
          ),
        )
      ],
    );
  }
}
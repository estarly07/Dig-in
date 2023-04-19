import 'package:flutter/material.dart';

import '../../../global/widgets/custom_card.dart';

class SocialMedia extends StatelessWidget {
  final double size;
  const SocialMedia({Key? key, required this.size,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCard(
          widget: Image.asset("assets/images/google.png",height: size,width: size,), 
          shadowColor: Colors.grey, 
          elevation: 5, 
          backgroundColor: Colors.white, 
          cornerRadius: 50)
      ],
    );
  }
}
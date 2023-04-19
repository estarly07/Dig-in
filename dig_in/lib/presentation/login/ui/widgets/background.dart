
import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  const Background({Key? key,required this.size,}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            "assets/images/food.jpg",
            fit: BoxFit.cover,
            height: size.height * 0.4,
          ),
        ),
      ],
    );
  }
}
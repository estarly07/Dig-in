import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Size size;
  final String imageFood;
  final Function onBack;
  final String idHero;
  const Header({
    Key? key,
    required this.size, 
    required this.imageFood, 
    required this.onBack,
    required this.idHero
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.025),
          child: Hero(
            tag: idHero,
            child: FadeInImage(
              placeholder: const AssetImage("assets/images/no_image.jpg"),
              fadeOutDuration: const Duration(seconds: 1),
              image: NetworkImage(imageFood),
              fit: BoxFit.cover,
              height: size.height * 0.45,
              width: size.width,
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.05,
          top: size.height * 0.05,
          child: InkWell(
            onTap: () => onBack(),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCard(
                elevation: 13,
                backgroundColor: Colors.white,
                cornerRadius: size.height,
                shadowColor: Colors.grey,
                widget: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.015
                  ),
                  child: CustomIconText(
                    text: "4.5", 
                    textColor: Colors.black, 
                    fontSize: 17,
                    withBold: true,
                    leftIcon: false,
                    icon: Icons.star,
                    colorIcon: Colors.orange.shade900,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: (){},
                backgroundColor: Colors.orange.shade900,
                child: Icon(Icons.favorite_border_rounded),
              )
            ],
          ),
        )
      ],
    );
  }
}
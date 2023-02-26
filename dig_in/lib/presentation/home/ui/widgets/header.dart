import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:dig_in/presentation/home/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        CustomIconText(
          text: "text", 
          withBold: false, 
          textColor: Colors.black, 
          fontSize: 15,
          icon: Icons.location_on_outlined,
          colorIcon: Colors.orange.shade900,
          leftIcon: true,
        ),
        const Spacer(),
        const CustomCard(
          backgroundColor: Colors.white,
          cornerRadius: 10,
          elevation: 5,
          shadowColor: Colors.black,
          widget: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.search),
          ),
        ),
        const CustomCard(
          backgroundColor: Colors.orange,
          cornerRadius: 10,
          elevation: 5,
          shadowColor: Colors.black,
          widget: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.search),
          ),
        )

      ],
    );
  }
}
import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  Comment({Key? key, required this.size})
      : super(
          key: key,
        );
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.025),
      child: Column(
        children: [
          _Header(size: size),
          SizedBox(
            height: size.height * 0.01,
          ),
          CustomText(
              withOverflow: false,
              maxLines: null,
              text:
                  "messsdddddddddddddd a gesssssssssssssssssssssssssssssssssssss",
              textColor: Colors.grey,
              fontSize: 15),
        ],
      ),
    );
  }
}

class _Header extends StatefulWidget {
  _Header({Key? key,required this.size}) : super(key: key);
  bool error = false;
  final Size size;
  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange.shade900.withOpacity(0.6),
          backgroundImage: NetworkImage(
              "https://concepto.de/wp-content/uploads/2018/08/persona-e1533759204552.jpg"),
          onBackgroundImageError: (_, __) => setState(() {
            widget.error = true;
          }),
          child: widget.error
              ? CustomText(text: "text", textColor: Colors.white, fontSize: 15)
              : Container(),
        ),
        SizedBox(
          width: widget.size.width * 0.03,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Estarly amaya",
                textColor: Colors.black,
                fontSize: 15,
                withOverflow: true,
                withBold: true,
              ),
              SizedBox(
                height: widget.size.height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: "message", textColor: Colors.black, fontSize: 15),
                  CustomText(
                      text: "aug 12, 2019",
                      textColor: Colors.grey,
                      fontSize: 15),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

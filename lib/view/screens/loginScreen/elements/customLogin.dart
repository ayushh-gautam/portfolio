// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/elements/myText.dart';

class MyButton extends StatelessWidget {
  void Function()? ontap;
  double left;
  double top;
  double bottom;
  double height;
  double width;
  MyButton({
    Key? key,
    required this.ontap,
    required this.left,
    required this.top,
    required this.bottom,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: left, //Constraints.maxWidth * 0.03,
          top: top, //Constraints.maxHeight * 0.018,
          bottom: bottom), //Constraints.maxHeight * 0.03),
      child: InkWell(
        onTap: () {
          print('hulululu');
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff03b44a)),
          height: height, //Constraints.maxHeight * 0.077,
          width: width, //Constraints.maxWidth * 0.86,
          child: MyText(
            fontSize: 34,
            text: 'Login',
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 23.0,
    this.fontWeight = FontWeight.bold,
    this.textAlign=TextAlign.start,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Cera Pro',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}



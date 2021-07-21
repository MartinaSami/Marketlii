import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight weight;
  TextAlign textAlign;
  CustomText({
    this.text,
    this.color,
    this.size,
    this.weight,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}

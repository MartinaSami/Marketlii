import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.colors,
    this.borderraduis
  }) : super(key: key);
  final String text;
  final Function press;
  final Color colors;
  final double borderraduis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderraduis)),
        color: colors,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(17),
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

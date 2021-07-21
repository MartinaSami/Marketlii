import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/helpers.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color disabledColor;
  final Color textColor;
  final Function onPressed;
  final double minWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final BorderRadius borderRadius;
  final double fontSize;

  AppButton(
      {this.text = '',
      this.color,
      this.textColor,
      this.onPressed,
      this.minWidth,
      this.verticalPadding = 16,
      this.horizontalPadding = 24,
      this.disabledColor,
      this.borderRadius,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(setWidth(10))),
      color: color ?? AppColors.primary,
      disabledColor: disabledColor,
      child: AppText(
        text: text,
        color: textColor ?? Colors.white,
        fontSize: fontSize,
      ),
      onPressed: onPressed,
      minWidth: minWidth,
      padding: EdgeInsets.symmetric(
          vertical: setHeight(verticalPadding),
          horizontal: setWidth(horizontalPadding)),
    );
  }
}

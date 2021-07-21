import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketlii/helper_tools/size_config.dart';

class AppText extends StatelessWidget {
  final String text;
  double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double height;
  final TextDecoration textDecoration;
  final TextOverflow textOverflow;
  final Color color;
  final int maxLines;
  final double letterSpacing;
  AppText(
      {this.text = '',
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.height = 1.2,
      this.textDecoration,
      this.textOverflow,
      this.color,
      this.maxLines,
      this.letterSpacing}) {
    fontSize = fontSize ?? ScreenUtil().setSp(15);
  }

  AppText.heading(
      {this.text = '',
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.height = 1.2,
      this.textDecoration,
      this.textOverflow,
      this.color,
      this.maxLines,
      this.letterSpacing}) {
    fontSize = fontSize ?? ScreenUtil().setSp(21);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: getSizeText(fontSize),
          fontWeight: fontWeight,
          decoration: textDecoration,
          height: height,
          color: color,
          letterSpacing: letterSpacing),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}

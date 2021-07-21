import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/helpers.dart';

class AppFormField extends StatelessWidget {
  final Widget prefix;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String initialValue;
  final String hintText;
  final String labelText;
  final int minLines;
  final int maxLines;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool dropdown;
  final List<DropdownMenuItem> items;
  final Function onChanged;
  final Function onSaved;
  final Function validator;
  final dynamic value;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  AppFormField(
      {this.prefixIcon,
      this.suffixIcon,
      this.prefix,
      this.labelText,
      this.hintText,
      this.minLines = 1,
      this.maxLines = 1,
      this.obscureText = false,
      this.keyboardType,
      this.dropdown = false,
      this.items,
      this.onChanged,
      this.value,
      this.onSaved,
      this.validator,
      this.initialValue,
      this.textEditingController,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    Widget formField;

    if (dropdown) {
      formField = DropdownButtonFormField(
        value: value,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefix: prefix,
            contentPadding: EdgeInsets.symmetric(vertical: setHeight(10))),
      );
    } else {
      formField = TextFormField(
        controller: textEditingController,
        initialValue: initialValue,
        focusNode: focusNode,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefix: prefix,
            contentPadding: EdgeInsets.symmetric(vertical: setHeight(10))),
        minLines: minLines,
        maxLines: maxLines,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
      );
    }

    // return AppCard(
    //
    //   vPadding: 0,
    //
    //   child: formField,
    //
    // );
  }
}

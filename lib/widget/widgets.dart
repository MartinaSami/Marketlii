export 'app_button.dart';
export 'app_text.dart';
export 'app_form_field.dart';
export 'lazy_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  TextEditingController controller;
  String name;

  TextFieldWidgets({this.controller, this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
       height: size.height * 0.0850,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return "";
          } else if (value.length < 2) {
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: name,
          suffixIcon: Icon(Icons.perm_identity,  size:  size.height * 0.03,),
          labelStyle: TextStyle(color: Colors.grey[400], fontSize: size.height * 0.026,),
        ),
      ),
    );
  }
}




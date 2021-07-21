import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function onClick;
  bool see;
  IconButton icon;
  TextEditingController controller;
  // ignore: missing_return
  String _errorMessage(String str) {
    switch (hint) {
      case 'الاسم الأول':
        return 'الاسم الأول فارغ';
      case 'الاسم الأخير':
        return 'الاسم الأخير فارغ';
      case 'البريد الالكتروني':
        return 'البريد الالكتروني فارغ';
      case 'كلمة السر':
        return 'كلمة السر فارغة';
    }
  }

  CustomTextField(
      {@required this.hint,
      @required this.onClick,
      @required this.controller,
      @required this.icon,
      @required this.see});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            height: 0.8,
          ),
          // ignore: missing_return
          validator: (value) {
            if (value.isEmpty) {
              return _errorMessage(hint);
            }
          },
          onSaved: onClick,
          obscureText: see == null ? false : see,

          decoration: InputDecoration(
            suffixIcon: icon == null ? SizedBox() : icon,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: getSizeText(3.3),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black54),
            ),
            border: OutlineInputBorder(
              // on error only
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ),
    );
  }
}

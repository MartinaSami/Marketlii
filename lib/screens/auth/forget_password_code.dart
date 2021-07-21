import 'package:flutter/material.dart';
import 'package:marketlii/screens/auth/new_password.dart';
import 'package:marketlii/widget/custom_submit_button.dart';
import 'package:marketlii/widget/custom_text.dart';
import 'package:marketlii/widget/custom_text_field.dart';

class ForgetPasswordCode extends StatelessWidget {
  static const String id = 'ForgetPasswordCode';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: height * .1,
            ),
            Hero(
              tag: 'Logo',
              child: Image.asset(
                'assets/images/marketlii.png',
                height: 56,
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            CustomText(
              text: 'هل نسيت كلمة السر؟',
              weight: FontWeight.bold,
              size: 20,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * .05,
            ),
            CustomTextField(
              hint: 'اكتب الكود',
              onClick: (value) {},
            ),
            SizedBox(
              height: height * .03,
            ),
            CustomSubmitButton(
              onClick: () {
                Navigator.pushNamed(context, NewPassword.id);
              },
              text: 'استرجاع',
            ),
          ],
        ),
      ),
    ));
  }
}

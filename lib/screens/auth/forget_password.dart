import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/provider/profile_provider.dart';
import 'package:marketlii/widget/custom_text.dart';
import 'package:marketlii/widget/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ForgetPassword extends StatefulWidget {
  static const String id = 'ForgetPassword';

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool a = true;
  bool a2 = true;
  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
      _btnController.stop();
    });
  }

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = new TextEditingController();
  TextEditingController passwordCon = new TextEditingController();

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
              see: a,
              icon: IconButton(
                  onPressed: () {
                    if (a) {
                      setState(() {
                        a = true;
                      });
                    } else {
                      setState(() {
                        a = false;
                      });
                    }
                  },
                  icon: a
                      ? Icon(Icons.visibility_off_outlined)
                      : Icon(Icons.visibility)),
              hint: 'كملة المرور',
              controller: password,
            ),
            SizedBox(
              height: height * .01,
            ),
            CustomTextField(
              see: a2,
              icon: IconButton(
                  onPressed: () {
                    if (a2) {
                      setState(() {
                        a2 = true;
                      });
                    } else {
                      setState(() {
                        a2 = false;
                      });
                    }
                  },
                  icon: a2
                      ? Icon(Icons.visibility_off_outlined)
                      : Icon(Icons.visibility)),
              hint: 'تاكيد كملة المرور',
              controller: passwordCon,
            ),
            SizedBox(
              height: height * .03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedLoadingButton(
                width: MediaQuery.of(context).size.width * 1,
                height: getProportionateScreenHeight(47),
                borderRadius: 10,
                color: AppColors.primary,
                child: Text('تغير',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                controller: _btnController,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Provider.of<UserProvider>(context, listen: false)
                        .editPassword(password.text, passwordCon.text);
                    _doSomething();
                  } else {
                    _btnController.reset();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

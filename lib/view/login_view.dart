import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/view/discount_view.dart';
import 'package:marketlii/view/forget_password.dart';
import 'package:marketlii/view/signup_view.dart';
import 'package:marketlii/widget/custom_submit_button.dart';
import 'package:marketlii/widget/custom_text.dart';
import 'package:marketlii/widget/custom_text_field.dart';

class LoginView extends StatelessWidget {
  static const String id = 'LoginView';
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
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
                text: 'تسجيل الدخول',
                weight: FontWeight.bold,
                size: 20,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * .05,
              ),
              CustomTextField(
                hint: 'البريد الالكتروني',
                onClick: (value) {
                  _email = value;
                },
              ),
              SizedBox(
                height: height * .03,
              ),
              CustomTextField(
                hint: 'كلمة السر',
                onClick: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: height * .07,
              ),
              CustomSubmitButton(
                onClick: () {
                  Navigator.pushNamed(context, DiscountView.id);
                },
                text: 'دخول',
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: '----------',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomText(
                      text: 'لدى حساب؟',
                      size: 15,
                      weight: FontWeight.bold,
                    ),
                  ),
                  CustomText(
                    text: '----------',
                  ),
                ],
              ),
              SizedBox(
                height: height * .01,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, ForgetPassword.id),
                child: Text(
                  'هل نسيت كلمة السر؟',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0XFFE44233),
                  ),
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, SignUpView.id),
                child: CustomText(
                  text: 'إنشاء حساب',
                  color: Color(0XFFE44233),
                  size: 18,
                  weight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/icons/facebook.png'),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/icons/search.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

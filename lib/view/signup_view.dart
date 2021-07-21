import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/view/home_view.dart';
import 'package:marketlii/view/login_view.dart';
import 'package:marketlii/widget/custom_submit_button.dart';
import 'package:marketlii/widget/custom_text.dart';
import 'package:marketlii/widget/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  static const String id = 'SignUpView';
  final _formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _phone, _password, _email;
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
                text: 'إنشاء حساب جديد',
                weight: FontWeight.bold,
                size: 20,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * .05,
              ),
              CustomTextField(
                hint: 'الاسم الأول',
                onClick: (value) {
                  _firstName = value;
                },
              ),
              SizedBox(
                height: height * .03,
              ),
              CustomTextField(
                hint: 'الاسم الأخير',
                onClick: (value) {
                  _lastName = value;
                },
              ),
              SizedBox(
                height: height * .03,
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
                hint: 'رقم الهاتف',
                onClick: (value) {
                  _phone = value;
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
                  Navigator.pushNamed(context, HomeView.id);
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
                onTap: () => Navigator.pushNamed(context, LoginView.id),
                child: CustomText(
                  text: 'تسجيل دخول',
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
              SizedBox(
                height: height * .1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
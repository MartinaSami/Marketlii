import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/api/auth_api.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/screens/auth/signup_view.dart';
import 'package:marketlii/widget/custom_text.dart';
import 'package:marketlii/widget/custom_text_field.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginView extends StatefulWidget {
  static const String id = 'LoginView';
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
    });
  }

  bool a = true;
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                controller: email,
                hint: 'البريد الالكتروني',
                onClick: (value) {
                  _email = value;
                },
              ),
              SizedBox(
                height: height * .03,
              ),
              CustomTextField(
                see: a,
                icon: IconButton(
                    onPressed: () {
                      if (a) {
                        setState(() {
                          a = false;
                        });
                      } else {
                        setState(() {
                          a = true;
                        });
                      }
                    },
                    icon: a
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility)),
                controller: password,
                hint: 'كلمة السر',
                onClick: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: height * .07,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundedLoadingButton(
                  width: MediaQuery.of(context).size.width * 1,
                  height: getProportionateScreenHeight(47),
                  borderRadius: 10,
                  color: AppColors.primary,
                  child: Text('Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  controller: _btnController,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Auth().UserLogin(
                        email.text,
                        password.text,
                        context,
                      );
                      _doSomething();
                    } else {
                      _btnController.reset();
                    }
                  },
                ),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     InkWell(
              //       onTap: () {},
              //       child: Image.asset('assets/icons/facebook.png'),
              //     ),
              //     SizedBox(
              //       width: 50,
              //     ),
              //     InkWell(
              //       onTap: () {},
              //       child: Image.asset('assets/icons/search.png'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}

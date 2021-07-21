import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketlii/api/auth_api.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/screens/auth/login_view.dart';
import 'package:marketlii/widget/custom_text.dart';
import 'package:marketlii/widget/custom_text_field.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignUpView extends StatefulWidget {
  static const String id = 'SignUpView';
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool a = true;
  bool a2 = true;
  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
    });
  }

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
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
                see: a2,
                icon: IconButton(
                    onPressed: () {
                      if (a2) {
                        setState(() {
                          a2 = false;
                        });
                      } else {
                        setState(() {
                          a2 = true;
                        });
                      }
                    },
                    icon: a
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility)),
                hint: 'كلمة السر',
                onClick: (value) {
                  _password = value;
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
                      Auth().UserRegister(
                        _firstName,
                        _email,
                        _password,
                        _phone,
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
                onTap: () {
                  Get.to(LoginView());
                },
                child: CustomText(
                  text: 'تسجيل دخول',
                  color: Color(0XFFE44233),
                  size: 18,
                  weight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
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

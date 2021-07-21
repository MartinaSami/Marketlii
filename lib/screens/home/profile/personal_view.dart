import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/provider/profile_provider.dart';
import 'package:marketlii/screens/auth/forget_password.dart';
import 'package:marketlii/widget/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class PersonalView extends StatefulWidget {
  static const String id = 'PersonalView';

  @override
  _PersonalViewState createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> {
  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
    });
  }

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController email = new TextEditingController();
    TextEditingController mobile = new TextEditingController();
    TextEditingController adress = new TextEditingController();
    final userData = Provider.of<UserProvider>(context, listen: false);
    userData.callAPIForUserData();
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0XFF242451),
        ),
        titleSpacing: 0,
        title: Image.asset('assets/images/marketlii-topbar.png'),
      ),
      body: Form(
        key: _formKey,
        child: Consumer<UserProvider>(
          builder: (_, pragma, __) {
            Widget content = pragma.getUserModelData == null
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pragma.list.name,
                                  style: TextStyle(
                                    color: Color(0XFF242451),
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  pragma.list.email,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF242451),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'معلوماتك الشخصية',
                                      style: TextStyle(
                                        color: Color(0XFF242451),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.bottomSheet(BottomSheet(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  topLeft: Radius.circular(15)),
                                            ),
                                            onClosing: () {},
                                            builder: (_) {
                                              return SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          30),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20,
                                                                vertical: 20),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomTextField(
                                                                controller:
                                                                    email,
                                                                hint: 'الاسم',
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    getProportionateScreenHeight(
                                                                        10),
                                                              ),
                                                              CustomTextField(
                                                                controller:
                                                                    mobile,
                                                                hint: 'الموبيل',
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    getProportionateScreenHeight(
                                                                        10),
                                                              ),
                                                              CustomTextField(
                                                                controller:
                                                                    adress,
                                                                hint: 'العنوان',
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                                child:
                                                                    RoundedLoadingButton(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      1,
                                                                  height:
                                                                      getProportionateScreenHeight(
                                                                          47),
                                                                  borderRadius:
                                                                      10,
                                                                  color: AppColors
                                                                      .primary,
                                                                  child: Text(
                                                                      'Login',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  onPressed:
                                                                      () {
                                                                    if (_formKey
                                                                        .currentState
                                                                        .validate()) {
                                                                      _formKey
                                                                          .currentState
                                                                          .save();
                                                                      userData.editProfileData(
                                                                          email
                                                                              .text,
                                                                          mobile
                                                                              .text,
                                                                          adress
                                                                              .text,
                                                                          context);
                                                                      //_doSomething();
                                                                    } else {}
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }));
                                        // showModalBottomSheet(
                                        //     backgroundColor: Colors.transparent,
                                        //     context: context,
                                        //     builder: (BuildContext context) {
                                        //       return DraggableScrollableSheet(
                                        //           initialChildSize:
                                        //               0.75, //set this as you want
                                        //           maxChildSize:
                                        //               0.75, //set this as you want
                                        //           minChildSize: 0.75, //s
                                        //           builder: (context,
                                        //               scrollController) {
                                        //            return
                                        //           });
                                        //     });
                                      },
                                      child: Text(
                                        'تعديل',
                                        style: TextStyle(
                                          color: Color(0XFFF47458),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'الاسم الاول',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF242451),
                                        ),
                                      ),
                                      Text(
                                        pragma.list.name,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF242451),
                                        ),
                                      ),
                                      Divider(
                                        color: Color(0XFF242451),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'اسم العائلة',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF242451),
                                        ),
                                      ),
                                      Text(
                                        pragma.list.name,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF242451),
                                        ),
                                      ),
                                      Divider(
                                        color: Color(0XFF242451),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "الرقم",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF242451),
                                        ),
                                      ),
                                      Text(
                                        pragma.list.mobile,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF242451),
                                        ),
                                      ),
                                      Divider(
                                        color: Color(0XFF242451),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'العنوان',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF242451),
                                        ),
                                      ),
                                      Text(
                                        pragma.list.address,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF242451),
                                        ),
                                      ),
                                      Divider(
                                        color: Color(0XFF242451),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'معلومات الأمان',
                                  style: TextStyle(
                                    color: Color(0XFF242451),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, ForgetPassword.id),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0XFFF47458),
                                        width: 3,
                                      ),
                                    ),
                                    child: Text(
                                      'تغيير كلمة السر',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF242451),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                    ],
                  );
            return content;
          },
        ),
      ),
      //
    );
  }
}

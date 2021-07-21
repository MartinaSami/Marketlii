import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/provider/order_provider/cart_provider.dart';
import 'package:marketlii/widget/app_text.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class NewCheckOutScreen extends StatefulWidget {
  String priec;
  NewCheckOutScreen({this.priec});

  @override
  _NewCheckOutScreenState createState() => _NewCheckOutScreenState();
}

class _NewCheckOutScreenState extends State<NewCheckOutScreen> {
  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
    });
  }

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  TextEditingController city = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary.withOpacity(0.3),
      ),
        bottomNavigationBar: Container(
          height: size.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              Provider.of<CartProvider>(context, listen: false)
                                          .count ==
                                      0
                                  ? '0'
                                  : widget.priec,
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: 'EGP',
                              color: AppColors.yellow,
                              fontSize: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: RoundedLoadingButton(
                      width: MediaQuery.of(context).size.width * 1,
                      height: getProportionateScreenHeight(47),
                      borderRadius: 10,
                      color: AppColors.primary,
                      child: Text('اتمام الشراء',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      controller: _btnController,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Provider.of<CartProvider>(context, listen: false)
                              .checkOut(
                            city.text,
                          );
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
          ),
        ),
        backgroundColor: AppColors.lightGrey,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            controller: city,
                            name: 'Address',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String name;

  TextFieldWidget({this.controller, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey[300])),
            labelStyle: TextStyle(color: AppColors.primary, fontSize: 16),
            labelText: name,
          )),
    );
  }
}

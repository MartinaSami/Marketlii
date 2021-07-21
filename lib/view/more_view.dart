import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketlii/api/auth_api.dart';
import 'package:marketlii/screens/home/order/order_menu.dart';
import 'package:marketlii/screens/home/profile/info_view.dart';
import 'package:marketlii/screens/home/profile/personal_view.dart';
import 'package:marketlii/view/main_screen_fav.dart';
import 'package:marketlii/widget/custom_more_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () async {
                                    SharedPreferences s =
                                        await SharedPreferences.getInstance();
                                    String token = s.getString('token');
                                    if (token == null) {
                                      Fluttertoast.showToast(
                                          msg: "تسجل دخول اولا",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      Navigator.pushNamed(
                                          context, OrderMenu.id);
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/icons/box.png',
                                    width: 40,
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFF242451),
                                ),
                              ),
                              Text(
                                'الطلبات',
                                style: TextStyle(
                                  color: Color(0xFF242451),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: "قريبا",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  child: Image.asset(
                                    'assets/icons/rebuy.png',
                                    width: 40,
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFF242451),
                                ),
                              ),
                              Text(
                                'استرجاع',
                                style: TextStyle(
                                  color: Color(0xFF242451),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => Fluttertoast.showToast(
                                    msg: "قريبا",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0),
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/bocket.png',
                                    width: 40,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFF242451),
                                  ),
                                ),
                              ),
                              Text(
                                'كاش باك',
                                style: TextStyle(
                                  color: Color(0xFF242451),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, MainScreenFav.id),
                                child: Container(
                                  child: Image.asset(
                                    'assets/icons/fav.png',
                                    width: 45,
                                    height: 45,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFF242451),
                                  ),
                                ),
                              ),
                              Text(
                                'المفضلة',
                                style: TextStyle(
                                  color: Color(0xFF242451),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Color(0xffD7D6D4),
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    'حسابي',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomMoreRow(
                name: 'قائمتي المفضلة',
                onClick: () {
                  Navigator.pushNamed(context, OrderMenu.id);
                },
              ),
              CustomMoreRow(
                name: 'العناوين',
                onClick: () {
                  Navigator.pushNamed(context, InfoView.id);
                },
              ),
              CustomMoreRow(
                name: 'الدفع',
                onClick: () {
                  Fluttertoast.showToast(
                      msg: "قريبا",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
              CustomMoreRow(
                name: 'الملف الشخصي',
                onClick: () async {
                  SharedPreferences s = await SharedPreferences.getInstance();
                  String token = s.getString('token');
                  if (token == null) {
                    Fluttertoast.showToast(
                        msg: "تسجل دخول اولا",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Navigator.pushNamed(context, PersonalView.id);
                  }
                },
              ),
              SizedBox(height: 10),
              Container(
                color: Color(0xffD7D6D4),
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    'تواصل معنا',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomMoreRow(
                name: 'الاتصال بنا',
                onClick: () {},
              ),
              CustomMoreRow(
                name: 'تسجيل الخروج',
                onClick: () {
                  Auth().userLogout(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

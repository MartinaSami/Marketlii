import 'package:flutter/material.dart';
import 'package:marketlii/widget/electric_body.dart';
import 'package:marketlii/widget/favorite_body.dart';
import 'package:marketlii/widget/home_body.dart';
import 'package:marketlii/widget/icon_body.dart';
import 'package:marketlii/widget/shoes_body.dart';

class HomeView extends StatefulWidget {
  static const String id = 'HomePage';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: AppBar(
            titleSpacing: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0XFF4DCFE0),
                ),
                border: InputBorder.none,
                hintText: 'عما تبحث.. ؟',
                hintStyle: TextStyle(
                  color: Color(0XFF4DCFE0),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            elevation: 0,
            bottom: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color(0XFF4DCFE0),
                labelColor: Color(0XFF242451),
                labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo'),
                tabs: [
                  Text(
                    'الشائعة',
                  ),
                  Image.asset('assets/icons/wheel-of-fortune.png'),
                  Text(
                    'المفضلة',
                  ),
                  Text(
                    'الأحذية',
                  ),
                  Text(
                    'الأجهزة الكهربائية',
                  ),
                ]),
          ),
        ),
        body: TabBarView(children: [
          homeBody(context),
          iconBody(context),
          favoriteBody(context),
          shoesBody(context),
          electricBody(context),
        ]),
      ),
    );
  }
}

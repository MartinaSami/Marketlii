import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/search/filter-page.dart';
import 'package:marketlii/viewmodel/category/category_view.dart';
import 'package:marketlii/viewmodel/product/product_view.dart';
import 'package:marketlii/viewmodel/slider_view.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/home/search/filter-page.dart';

Widget homeBody(context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Stack(
      children: [
        ListView(
          children: [
            SliderView(),
            SizedBox(height: 40),
            CategoryView(),
            SizedBox(height: 40),
            ProductView()
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: FloatingActionButton(
            backgroundColor: Color(0XFF242451),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: FilterPage(),
                ),
              );
            },
            child: Icon(Icons.filter_alt),
          ),
        ),
      ],
    ),
  );
}

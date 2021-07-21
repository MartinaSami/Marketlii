import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/cart/cart/cart.dart';

class CartView extends StatefulWidget {
  static const String id = 'CartView';

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CartPage(),
    );
  }
}

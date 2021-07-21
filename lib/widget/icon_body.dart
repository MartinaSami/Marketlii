import 'package:flutter/material.dart';

Widget iconBody(context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Center(
      child: Image.asset(
        'assets/images/big-wheel-of-fortune.png',
        fit: BoxFit.cover,
      ),
    ),
  );
}

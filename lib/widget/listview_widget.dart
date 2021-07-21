import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListView extends StatelessWidget {
  @required
  String text;

  @required
  Function onTap;

  CustomListView({@required this.text, @required this.onTap});
  @override
  Widget build (BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 15,),
        ],
      ),
    );
  }
}

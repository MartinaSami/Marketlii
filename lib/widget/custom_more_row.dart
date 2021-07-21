import 'package:flutter/material.dart';

class CustomMoreRow extends StatelessWidget {
  final String name;
  final Function onClick;
  CustomMoreRow({@required this.name, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 10,
        bottom: 15,
      ),
      child: InkWell(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 20,
              color: Color(
                0xff242451,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

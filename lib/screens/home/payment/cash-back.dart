import 'package:flutter/material.dart';

class CashBack extends StatelessWidget {
  static const String id = 'CashBack';

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(36, 36, 81, 1);
    Color orange = Color.fromRGBO(244, 116, 88, 1);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0XFF242451),
        ),
        titleSpacing: 0,
        title: Image.asset('assets/images/marketlii-topbar.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: height / 25,
            ),
            Text(
              'رصيد المحفظه',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: orange),
            ),
            Text(
              'ج.م 30',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: color),
            ),
            SizedBox(
              height: height / 25,
            ),
            Text(
              'استخدام كارت خصم ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: orange),
            ),
            SizedBox(
              height: height / 50,
            ),
            Text(
              '  رجعلك كاش باك من شراءك ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                    Text(
                      'ج.م 30',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                  ],
                ),
                Container(
                  width: width / 4,
                  height: height / 4,
                  child: Image.asset(
                    'assets/images/blue-shoes.png',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

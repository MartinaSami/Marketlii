import 'package:flutter/material.dart';

class PocketMoney extends StatelessWidget {
  static const String id = 'PocketMoney';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0XFF242451),
        ),
        titleSpacing: 0,
        title: Image.asset('assets/images/marketlii-topbar.png'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text(
                      'رصيد المحفظة',
                      style: TextStyle(
                        color: Color(0XFFF47458),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '0.00 ج.م',
                      style: TextStyle(
                        color: Color(0XFF242451),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'استخدم كارت خصم',
                      style: TextStyle(
                        color: Color(0XFFF47458),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Text(
                'لسه معندكش رصيد اشتري عشان يرجعلك كاش باك',
                style: TextStyle(
                  color: Color(0XFFF47458),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

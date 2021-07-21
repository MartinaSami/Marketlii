import 'package:flutter/material.dart';
import 'package:marketlii/view/payment_bill.dart';

class OrderMenu extends StatelessWidget {
  static const String id = 'OrderMenu';

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
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              'طلباتك',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            SizedBox(
              height: 20,
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
                      'قيد التجهيز',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: orange),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, PaymentBill.id),
                      child: Row(
                        children: [
                          Text(
                            'اطلع علي',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          InkWell(
                            child: Text(
                              ' التفاصيل',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: orange),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/smallblueshoes.png',
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
                      ' تم استلامها من الساعي ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: orange),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, PaymentBill.id),
                      child: Row(
                        children: [
                          Text(
                            'اطلع علي',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          InkWell(
                            child: Text(
                              ' التفاصيل',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: orange),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/smallblueshoes.png',
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
                      'تم التوصيل',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: orange),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, PaymentBill.id),
                      child: Row(
                        children: [
                          Text(
                            'اطلع علي',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          InkWell(
                            child: Text(
                              ' التفاصيل',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: orange),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/smallblueshoes.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

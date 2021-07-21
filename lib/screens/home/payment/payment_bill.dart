import 'package:flutter/material.dart';
import 'package:marketlii/view/main_screen.dart';

class PaymentBill extends StatelessWidget {
  static const String id = 'PaymentBill';

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/white-shoes.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: width / 80,
                      ),
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
                            ' ج.م100 ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          Text(
                            'ميعاد التوصيل /17 مايو ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: orange),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                      Text(
                        'الكميه',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey[300],
                        size: 30,
                      ),
                      Text(
                        'اللون',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Row(
                    children: [
                      Text(
                        'سعر القطع',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        ' 100ج.م',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Row(
                    children: [
                      Text(
                        'سعر التوصيل',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        ' 20.م',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' الاجمالي',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        ' 120.م',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Text(
                    'عنوان التوصيل',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                  Text(
                    ' حلوان-القاهره-مصر',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                  Text(
                    ' 2010245454+',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, MainScreen.id),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              width: double.infinity,
              color: Color(0XFF242451),
              child: Text(
                'الذهاب للرئيسية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

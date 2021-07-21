import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  static const String id = 'PaymentPage';

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Color color = Color.fromRGBO(36, 36, 81, 1);
  Color orange = Color.fromRGBO(244, 116, 88, 1);

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '15121432543231355',
                            style: TextStyle(color: color, fontSize: 12),
                          ),
                          Row(
                            children: [
                              Text(
                                '25/3',
                                style: TextStyle(color: color, fontSize: 12),
                              ),
                              Text(
                                'تعديل',
                                style: TextStyle(
                                    color: orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          width: width / 8,
                          height: height / 8,
                          child: Image.asset(
                            'assets/icons/visa.png',
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '15121432543231355',
                            style: TextStyle(color: color, fontSize: 12),
                          ),
                          Row(
                            children: [
                              Text(
                                '25/3',
                                style: TextStyle(color: color, fontSize: 12),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text(
                                'تعديل',
                                style: TextStyle(
                                    color: orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              ButtonTheme(
                                height: height / 25,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                    color: orange,
                                    child: Text(
                                      "استخدام",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0))),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                          width: width / 8,
                          height: height / 8,
                          child: Image.asset(
                            'assets/icons/mastercard.png',
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '15121432543231355',
                            style: TextStyle(color: color, fontSize: 12),
                          ),
                          Row(
                            children: [
                              Text(
                                '25/3',
                                style: TextStyle(color: color, fontSize: 12),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text(
                                'تعديل',
                                style: TextStyle(
                                    color: orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              ButtonTheme(
                                height: height / 25,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                    color: orange,
                                    child: Text(
                                      "استخدام",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0))),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                          width: width / 8,
                          height: height / 8,
                          child: Image.asset(
                            'assets/icons/visa.png',
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '15121432543231355',
                            style: TextStyle(color: color, fontSize: 12),
                          ),
                          Row(
                            children: [
                              Text(
                                '25/3',
                                style: TextStyle(color: color, fontSize: 12),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text(
                                'تعديل',
                                style: TextStyle(
                                    color: orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              ButtonTheme(
                                height: height / 25,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  color: orange,
                                  child: Text(
                                    "استخدام",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          width: width / 8,
                          height: height / 8,
                          child: Image.asset(
                            'assets/icons/mastercard.png',
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              width: double.infinity,
              color: Color(0XFF242451),
              child: Text(
                'أضف بطاقة',
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

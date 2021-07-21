import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/payment/visa_payment.dart';

class ContinueOrderWithVisaNumber extends StatefulWidget {
  static const String id = 'ContinueOrderWithVisaNumber';

  @override
  _ContinueOrderWithVisaNumberState createState() =>
      _ContinueOrderWithVisaNumberState();
}

class _ContinueOrderWithVisaNumberState
    extends State<ContinueOrderWithVisaNumber> {
  bool checkboxValue = false;
  bool moneyCheckBox = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFD7D6D4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0XFF242451),
        ),
        titleSpacing: 0,
        title: Image.asset('assets/images/marketlii-topbar.png'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الشحن الى',
                              style: TextStyle(
                                color: Color(0xFFE44233),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'تغيير العنوان',
                              style: TextStyle(
                                color: Color(0xFFE44233),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'حلوان - القاهره - مصر - 51788',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '201022687846+',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'طريقة الدفع',
                      style: TextStyle(
                        color: Color(0xFFE44233),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        checkboxValue = !checkboxValue;
                                        moneyCheckBox = !moneyCheckBox;
                                      });
                                    },
                                    child: checkboxValue
                                        ? Icon(
                                            Icons.radio_button_unchecked,
                                            color: Colors.grey,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.check_circle,
                                            color: Color(0XFF242451),
                                            size: 20,
                                          ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "الدفع باستخدام كارت البنك",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0XFF242451),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/icons/credit-card.png',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, VisaPayment.id),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0XFF242451),
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  '152022232425262728',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0XFFE44233),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    moneyCheckBox = !moneyCheckBox;
                                    checkboxValue = !checkboxValue;
                                  });
                                },
                                child: moneyCheckBox
                                    ? Icon(
                                        Icons.radio_button_unchecked,
                                        color: Colors.grey,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.check_circle,
                                        color: Color(0XFF242451),
                                        size: 20,
                                      ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "الدفع نقدا",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0XFF242451),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/icons/money-bill.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'ملخص الطلبية',
                      style: TextStyle(
                        color: Color(0xFFE44233),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'مجموع السعر',
                                style: TextStyle(
                                  color: Color(0xFF242451),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('100 ج.م',
                                  style: TextStyle(
                                    color: Color(0xFF242451),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('سعر الشحن',
                                  style: TextStyle(
                                    color: Color(0xFF242451),
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('20 ج.م',
                                  style: TextStyle(
                                    color: Color(0xFF242451),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Divider(
                            color: Color(0XFF30305B),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('مجموع السعر',
                                  style: TextStyle(
                                    color: Color(0xFF242451),
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('120 ج.م',
                                  style: TextStyle(
                                    color: Color(0xFF242451),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'مراجعة الطلبية',
                      style: TextStyle(
                        color: Color(0xFFE44233),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'اديدس',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'حذاء كاجوال رياضي سهل الارتداء - كحلي',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '100 جم',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      'الكمية 1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'التوصيل خلال 3 ايام',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'توصيل',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'الخميس 4 مايو',
                                          style: TextStyle(
                                            color: Color(0xffF47458),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'البائع ماركتلي',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Image.asset(
                                    'assets/images/white-shoes.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0XFF242451),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Text(
                  'اطلب دلوقتي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

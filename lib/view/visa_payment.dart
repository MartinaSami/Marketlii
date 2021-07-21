import 'package:flutter/material.dart';
import 'package:marketlii/view/continue_order_with_visa_number.dart';

class VisaPayment extends StatefulWidget {
  static const String id = 'VisaPayment';

  @override
  _VisaPaymentState createState() => _VisaPaymentState();
}

class _VisaPaymentState extends State<VisaPayment> {
  Color color = Color.fromRGBO(36, 36, 81, 1);
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نقبل',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: color, fontSize: 12),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icons/visa.png'),
                      SizedBox(
                        width: width / 40,
                      ),
                      Image.asset('assets/icons/mastercard.png'),
                    ],
                  ),
                  SizedBox(
                    height: height / 10,
                  ),
                  Text(
                    'رقم الكارت ',
                    style: TextStyle(color: color, fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width / 3,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: "ادخل رقم الكارت"),
                        ),
                      ),
                      Image.asset('assets/icons/credit-card.png'),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('تاريخ انتهاء الصلاحيه')),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(child: Text('CVV')),
                    ],
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(hintText: "MM/YY"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(hintText: "CW رمز"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'تذكر هذه البطاقه',
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            checkboxValue = !checkboxValue;
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
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ContinueOrderWithVisaNumber.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0XFF242451),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Text(
                    'تأكيد',
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
      ),
    );
  }
}

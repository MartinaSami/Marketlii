import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  static const String id = 'OrderScreen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isVisible = false;
  bool isVisibleTwo = false;
  Color color = Color.fromRGBO(36, 36, 81, 1);
  int value = 1;
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'حلوان - القاهرة - 50210',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0XFF242451),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'تعديل',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0XFFF47458),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                    Text(
                      'ميعاد التوصيل /17 مايو ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  width: width / 15,
                ),
                Container(
                  width: width / 4,
                  height: height / 6,
                  child: Image.asset('assets/images/white-shoes.png'),
                ),
              ],
            ),
            SizedBox(
              height: height / 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text('الكميه ',
                      style: TextStyle(
                          fontSize: 15,
                          color: color,
                          fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove_circle_sharp,
                    color: color,
                    size: 25,
                  ),
                  onPressed: () {
                    if (value != 0) {
                      setState(() {
                        value--;
                      });
                    }
                  },
                ),
                Text(
                  '$value',
                  style: TextStyle(
                      fontSize: 15, color: color, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: color,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      value++;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "اللون",
                    style: TextStyle(
                        fontSize: 15,
                        color: color,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.grey[300],
                    size: 30,
                  )
                ],
              ),
            ),
            Card(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "اكتب كود الخصم"),
                      )),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'ادخال',
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'ج.م 100 ',
                    style: TextStyle(
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'سعر القطع ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'ج.م 20 ',
                    style: TextStyle(
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'سعر التوصيل ',
                    style: TextStyle(
                        fontSize: 9, color: color, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ج.م 120 ',
                    style: TextStyle(
                        fontSize: 16,
                        color: color,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' الاجمالي ',
                    style: TextStyle(
                        fontSize: 15,
                        color: color,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                        if (isVisibleTwo) {
                          setState(() {
                            isVisibleTwo = false;
                          });
                        }
                      });
                    },
                    child: Image.asset('assets/icons/greymastercard.png')),
                InkWell(
                    onTap: () {
                      setState(() {
                        isVisibleTwo = !isVisibleTwo;
                        if (isVisible) {
                          setState(() {
                            isVisible = false;
                          });
                        }
                      });
                    },
                    child: Image.asset('assets/icons/visa.png')),
                InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = false;
                        isVisibleTwo = false;
                      });
                    },
                    child: Image.asset('assets/icons/cash.png')),
              ],
            ),
            Visibility(
              visible: isVisible,
              child: Container(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Container(
                      child: Card(
                        elevation: 2.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "رقم الفيزا"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                child:
                                    Image.asset('assets/icons/mastercard.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 1.0,
                          child: Container(
                            width: 70,
                            height: 50,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "00"),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 1.0,
                          child: Container(
                            width: 70,
                            height: 50,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "00"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Text(
                            'تاريخ الانتهاء',
                            style: TextStyle(
                              color: color,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "رمز cW",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isVisibleTwo,
              child: Container(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Container(
                      child: Card(
                        elevation: 2.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "رقم الفيزا"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/icons/visa.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 1.0,
                          child: Container(
                            width: 70,
                            height: 50,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "00"),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 1.0,
                          child: Container(
                            width: 70,
                            height: 50,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "00"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Text(
                            'تاريخ الانتهاء',
                            style: TextStyle(
                              color: color,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "رمز cW",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              // ignore: deprecated_member_use
              child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'اطلب الان',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  color: color,
                  // textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 13)),
            ),
          ],
        ),
      ),
    );
  }
}

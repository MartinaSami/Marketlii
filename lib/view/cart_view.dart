import 'package:flutter/material.dart';
import 'package:marketlii/view/continue_order.dart';
import 'package:marketlii/view/order_view.dart';

class CartView extends StatefulWidget {
  static const String id = 'CartView';

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff242451),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'هدية مجانية',
                        style: TextStyle(
                          color: Color(0xffF47458),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'خصم 100 ج علي أي منتج بمناسبه العيد',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'استخدم الخصم',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('اديدس'),
                                      Text(
                                          'حذاء كاجوال رياضي سهل الارتداء - كحلي'),
                                      Row(
                                        children: [
                                          Text(
                                            'تصل لك',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            'غدا 4 مايو',
                                            style: TextStyle(
                                              color: Color(0xffF47458),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '100 جم',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('1'),
                                Icon(Icons.favorite_border),
                                Text('اضافه'),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.home),
                                      Text('حذف'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              elevation: 2.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            color: Color(0XFF242451),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: 1),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ContinueOrder.id);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

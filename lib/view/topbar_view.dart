import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/order/order_request.dart';

class TopBarView extends StatelessWidget {
  static const String id = 'TopBarView';
  List orders = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0XFF242451),
          ),
          titleSpacing: 0,
          title: Image.asset('assets/images/marketlii-topbar.png'),
          bottom: TabBar(
              indicatorColor: Color(0XFFF47458),
              labelColor: Color(0XFF242451),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
              tabs: [
                Text(
                  'المطلوب',
                ),
                Text(
                  'اللي اتوافق عليه',
                ),
              ]),
        ),
        body: TabBarView(children: [
          orders.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مفيش اي منتجات عملتلها طلب ارجاع',
                      style: TextStyle(
                        color: Color(0XFF242451),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, OrderRequest.id),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Color(0XFFF47458),
                        child: Text(
                          'تقديم طلب',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
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
                                  color: Color(0XFF242451),
                                ),
                              ),
                              Text(
                                'تمت الموافقه سيتم التواصل معك',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFF47458),
                                ),
                              ),
                            ],
                          ),
                          Image.asset('assets/images/smallblueshoes.png'),
                        ],
                      )
                    ],
                  ),
                ),
          orders.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مفيش اي منتجات عملتها اتوافق عليها',
                      style: TextStyle(
                        color: Color(0XFF242451),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, OrderRequest.id),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Color(0XFFF47458),
                        child: Text(
                          'تقديم طلب',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
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
                                  color: Color(0XFF242451),
                                ),
                              ),
                              Text(
                                'تمت الموافقه سيتم التواصل معك',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFF47458),
                                ),
                              ),
                            ],
                          ),
                          Image.asset('assets/images/smallblueshoes.png'),
                        ],
                      )
                    ],
                  ),
                )
        ]),
      ),
    );
  }
}

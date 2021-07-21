import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  static const String id = 'InfoView';

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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.location_pin),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF47458),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'رئيسي',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'تعديل',
                            style: TextStyle(
                              color: Color(0XFF242451),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'الاسم',
                                  style: TextStyle(
                                    color: Color(0XFF242451),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Mohamed Adel',
                                  style: TextStyle(
                                    color: Color(0XFF242451),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'العنوان',
                                  style: TextStyle(
                                    color: Color(0XFF242451),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'القاهره - مترو حلوان - مصر',
                                  style: TextStyle(
                                    color: Color(0XFF242451),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'رقم الموبيل',
                                  style: TextStyle(
                                    color: Color(0XFF242451),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '01022687846',
                                  style: TextStyle(
                                    color: Color(0XFF242451),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: 2),
        ));
  }
}

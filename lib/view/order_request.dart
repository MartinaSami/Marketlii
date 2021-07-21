import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketlii/view/topbar_view.dart';

class OrderRequest extends StatelessWidget {
  static const String id = 'OrderRequest';

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0XFFF47458),
              padding: EdgeInsets.all(10),
              child: Text(
                'اضف المنتج',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('حذاء كاجوال رياضي سهل الارتداء - كحلي'),
                Image.asset('assets/images/smallblueshoes.png'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('سبب الارجاع'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'عايز ترجع المنتج ليه؟',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'ارفع الفاتوره',
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              color: Color(0XFFF47458),
              child: Text(
                'صور المنتج',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '500.jpg',
              style: TextStyle(
                color: Color(0xFF242451),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              '500.jpg',
              style: TextStyle(
                color: Color(0xFF242451),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, TopBarView.id),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                color: Color(0xFF242451),
                child: Text(
                  'قدم الطلب',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

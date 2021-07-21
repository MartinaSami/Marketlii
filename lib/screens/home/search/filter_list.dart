import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/payment/payment_filter.dart';
import 'package:marketlii/screens/home/search/dell_filter.dart';
import 'package:marketlii/screens/home/search/laptop_filter.dart';
import 'package:marketlii/view/recently_arrived.dart';
import 'package:marketlii/widget/listview_widget.dart';

class FilterList extends StatelessWidget {
  static const String id = 'FilterList';

  const FilterList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color orange = Color.fromRGBO(244, 116, 88, 1);
    Color color = Color.fromRGBO(36, 36, 81, 1);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0XFF242451),
          ),
          titleSpacing: 0,
          title: Image.asset('assets/images/marketlii-topbar.png'),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Text(
                'الفئه',
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              CustomListView(
                text: 'اللابتوب',
                onTap: () {
                  Navigator.pushNamed(context, LaptopFilter.id);
                },
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'الماركه',
                onTap: () {
                  Navigator.pushNamed(context, DellFilter.id);
                },
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'السعر',
                onTap: () {
                  Navigator.pushNamed(context, PaymentFilter.id);
                },
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'وصل حديثا',
                onTap: () {
                  Navigator.pushNamed(context, RecentlyArrived.id);
                },
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'نوع الابتوب ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'نوع المعالج ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: ' حجم ذاكره الرام ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: ' حجم القرص الصلب ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: ' ذاكره الرسومات ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: ' التخزين ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'حجم الشاشه ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'نظام التشغيل ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'اللون  ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'اصدار نظام التشغيل  ',
                onTap: () {},
              ),
              Divider(
                thickness: 1,
              ),
              CustomListView(
                text: 'البائع  ',
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: orange,
                    onPressed: () => {},
                    child: Text('تاكيد'),
                  ),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () => {},
                    child: Text('الغاء'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

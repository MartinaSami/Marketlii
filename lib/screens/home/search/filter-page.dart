import 'package:flutter/material.dart';
import 'package:marketlii/screens/home/search/filter_list.dart';

class FilterPage extends StatelessWidget {
  static const String id = 'FilterPage';

  const FilterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(36, 36, 81, 1);
    Color orange = Color.fromRGBO(244, 116, 88, 1);
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
      backgroundColor: Color.fromRGBO(237, 237, 236, 1),
      body: ListView(
        children: [
          Container(
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    'الفلتر ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 15),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الفئات'),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  onPressed: () {
                    Navigator.pushNamed(context, FilterList.id);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'الاكثر انتشارا',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: orange),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('السعر: من الاعلي الي الاقل'),
                    IconButton(
                        icon: Icon(
                          Icons.check_circle,
                          color: color,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('السعر: من الاقل الي الاعلي'),
                    IconButton(
                        icon: Icon(
                          Icons.check_circle_outline_sharp,
                          color: color,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

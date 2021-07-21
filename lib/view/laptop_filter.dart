import 'package:flutter/material.dart';

class LaptopFilter extends StatefulWidget {
  const LaptopFilter({Key key}) : super(key: key);
  static const String id = 'LaptopFilter';

  @override
  _LaptopFilterState createState() => _LaptopFilterState();
}

class _LaptopFilterState extends State<LaptopFilter> {
  bool checkboxValue = false;

  Color color = Color.fromRGBO(36, 36, 81, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'الغاء ',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            Row(
              children: [
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
                Text(
                  'الابتوب',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold, color: color),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
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
                  Text(
                    'اجهزه الكمبيوتر المحموله',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, color: color),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      checkboxValue = !checkboxValue;
                    });
                  },
                  child: checkboxValue
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.grey,
                          size: 20,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                          color: Color(0XFF242451),
                          size: 20,
                        ),
                ),
                Text(
                  ' كمبيوتر ',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold, color: color),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      checkboxValue = !checkboxValue;
                    });
                  },
                  child: checkboxValue
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.grey,
                          size: 20,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                          color: Color(0XFF242451),
                          size: 20,
                        ),
                ),
                Text(
                  ' موبايلات ',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold, color: color),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

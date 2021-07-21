import 'package:flutter/material.dart';

class RecentlyArrived extends StatefulWidget {
  const RecentlyArrived({Key key}) : super(key: key);
  static const String id = 'RecentlyArrived';

  @override
  _RecentlyArrivedState createState() => _RecentlyArrivedState();
}

class _RecentlyArrivedState extends State<RecentlyArrived> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;

  @override
  Widget build(BuildContext context) {
    Color orange = Color.fromRGBO(244, 116, 88, 1);
    Color blue = Color.fromRGBO(36, 36, 81, 1);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.article), onPressed: () {}),
                  Text(
                    'الغاء ',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: blue),
                  ),
                ],
              ),
              Theme(
                data: new ThemeData(
                  primaryColor: orange,
                  primaryColorDark: orange,
                ),
                child: new TextField(
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: orange)),
                      hintText: 'بحث   ',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(36, 36, 81, 1),
                      ),
                      suffixStyle: const TextStyle(
                        color: Color.fromRGBO(36, 36, 81, 1),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' اخر 7 ايام ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, color: blue),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          checkboxValue1 = !checkboxValue1;
                        });
                      },
                      child: checkboxValue1
                          ? Icon(
                              Icons.check_box,
                              color: orange,
                              size: 20,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: orange,
                              size: 20,
                            )),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' اخر 30 ايام ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, color: blue),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          checkboxValue2 = !checkboxValue2;
                        });
                      },
                      child: checkboxValue2
                          ? Icon(
                              Icons.check_box,
                              color: orange,
                              size: 20,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: orange,
                              size: 20,
                            )),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' اخر 60 ايام ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, color: blue),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          checkboxValue3 = !checkboxValue3;
                        });
                      },
                      child: checkboxValue3
                          ? Icon(
                              Icons.check_box,
                              color: orange,
                              size: 20,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: orange,
                              size: 20,
                            )),
                ],
              ),

              SizedBox(
                height: 70,
              ),
              // ignore: deprecated_member_use
              Center(
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                  color: orange,
                  onPressed: () => {},
                  child: Text(
                    'تفعيل',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

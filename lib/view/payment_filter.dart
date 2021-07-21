import 'package:flutter/material.dart';

class PaymentFilter extends StatelessWidget {
  const PaymentFilter({Key key}) : super(key: key);
  static const String id = 'PaymentFilter';

  @override
  Widget build(BuildContext context) {
    Color orange = Color.fromRGBO(244, 116, 88, 1);
    Color blue = Color.fromRGBO(36, 36, 81, 1);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'الحد الادني \n 3000',
                    style: TextStyle(color: blue),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'الحد الافصي \n 5000',
                    style: TextStyle(color: blue),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                // ignore: deprecated_member_use
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
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

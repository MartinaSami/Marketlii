import 'package:flutter/material.dart';

class DellFilter extends StatelessWidget {
  const DellFilter({Key key}) : super(key: key);
  static const String id = 'DellFilter';

  @override
  Widget build(BuildContext context) {
    Color orange = Color.fromRGBO(244, 116, 88, 1);
    Color blue = Color.fromRGBO(36, 36, 81, 1);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.article), onPressed: (){}),
                Text(
                  'الغاء ',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: blue),
                ),
              ],),
              Theme(
                data: new ThemeData(
                  primaryColor: orange,
                  primaryColorDark: orange,
                ),
                child: new TextField(
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: orange)),
                      hintText: 'بحث',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(36, 36, 81, 1),
                      ),
                      suffixStyle: const TextStyle(
                        color: Color.fromRGBO(244, 116, 88, 1),
                      )),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'ديل 22 ',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: blue),
              ),
              Divider(
                thickness: 1,
              ),
              Text(
                ' اتش بي ',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: blue),
              ),
              Divider(
                thickness: 1,
              ),
              Text(
                'ابل  ',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: blue),
              ),
              Divider(
                thickness: 1,
              ),
              Text(
                'مايكروسوفت  ',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: blue),
              ),
              Divider(
                thickness: 1,
              ),
              Text(
                ' اسوس',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: blue),
              ),
              SizedBox(
                height: 50,
              ),
              // ignore: deprecated_member_use
              Center(
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 120,vertical: 10),
                  color: orange,
                  onPressed: () => {},
                  child: Text('تفعيل',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

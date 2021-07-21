import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

Color primaryColor(BuildContext context) {
  return Theme.of(context).primaryColor;
}

Color accentColor(BuildContext context) {
  return Theme.of(context).accentColor;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double setWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double setHeight(double height) {
  return ScreenUtil().setHeight(height);
}

double setSp(double size) {
  return ScreenUtil().setSp(size);
}

enum ToastType { success, failed }

class NewWidget extends StatelessWidget {
  String time;
  Color color;
  final Size size;
  NewWidget({this.size, this.color, this.time});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: Colors.black38.withOpacity(0.09))
        ], borderRadius: BorderRadius.circular(10), color: Color(0xffF6F7FB)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'موعد مع العميل',
                      style: TextStyle(
                          fontSize: size.height * 0.024,
                          color: Color(0xff222455),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo'),
                    ),
                    Row(
                      children: [
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: size.height * 0.017,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.watch_later_outlined,
                          size: size.height * 0.024,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: color),
                  child: Text(
                    'هام',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.023,
                        fontFamily: 'Cairo'),
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

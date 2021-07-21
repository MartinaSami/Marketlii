import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketlii/helper_tools/size_config.dart';
import 'package:marketlii/helper_tools/theme/app_colors.dart';
import 'package:marketlii/screens/order/order_menu.dart';
import 'package:marketlii/view/main_screen.dart';
import 'package:marketlii/widget/app_text.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.primary,
              size: getSizeText(15),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            AppText(
              text: 'تم تاكيد الطلب بنجاح',
              fontSize: 4.2,
              color: AppColors.primary,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            OutlineButton(
                child: AppText(
                  text: 'صفحة الاوردرات',
                  fontSize: 3.6,
                  color: AppColors.primary,
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Get.to(OrderMenu());
                }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            OutlineButton(
                child: AppText(
                  text: 'ok',
                  fontSize: 3.6,
                  color: AppColors.primary,
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Get.to(MainScreen());
                })
          ],
        ),
      ),
    );
  }
}

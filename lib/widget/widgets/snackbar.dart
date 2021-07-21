import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  errorShowSnackBar(String text) {
    return Get.snackbar(
      '',
      '',
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(text),
        ],
      ),
      titleText: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Text('خطأ'),
            ],
          ),
        ],
      ),
      icon: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.clear,
            color: Colors.red,
          )),
      colorText: Colors.black54,
      backgroundColor: Colors.white,
      borderRadius: 5,
    );
  }

  notErrorShowSnackBar(String text) {
    return Get.snackbar(
      '',
      '',
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(text),
        ],
      ),
      titleText: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Text('عملية ناجحة'),
            ],
          ),
        ],
      ),
      icon: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.check,
            color: Colors.green,
          )),
      colorText: Colors.black54,
      backgroundColor: Colors.white,
      borderRadius: 5,
    );
  }
}

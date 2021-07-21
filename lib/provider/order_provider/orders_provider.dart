import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/orders_model.dart';
import 'package:marketlii/widget/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Orders list;

  var count;

  get getOrdersModelData => list;

  Future<Null> callAPIForOrdersData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    http.Response response = await http.get(Uri.parse(HOST + ORDERS), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      _isLoading = false;
    } else {
      _isLoading = false;
      list = Orders.fromJson(json.decode(response.body));
      count = list.data.length;
      print(count);
      notifyListeners();
    }
  }

  Future removeOrder(
    id,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    notifyListeners();
    var response = await http
        .post(Uri.parse('https://marketlii.matsuda.website/api/remove_order'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "id": id,
    });
    callAPIForOrdersData();
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      Get.back();
      CustomSnackBar().notErrorShowSnackBar(data['message']);
      print(data);
    } else {
      CustomSnackBar().errorShowSnackBar(data['message']);
      print(response.body);
    }
    notifyListeners();
  }
}

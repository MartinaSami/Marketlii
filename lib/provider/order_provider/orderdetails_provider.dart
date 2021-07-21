import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/orderdetails_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailsProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  OrdersDetails list;

  var count;

  get getOrdersModelData => list;

  Future<Null> callAPIForOrdersData(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    http.Response response =
        await http.get(Uri.parse(HOST + ORDERDETAILS + id), headers: {
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
      list = OrdersDetails.fromJson(json.decode(response.body));
      print(count);
      notifyListeners();
    }
  }
}

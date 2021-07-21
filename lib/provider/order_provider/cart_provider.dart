import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/cart_model.dart';
import 'package:marketlii/screens/home/cart/cart/confirmo_order.dart';
import 'package:marketlii/widget/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Cart list;

  var count;

  get getCategoriesModelData => list;

  Future<Null> callAPIForCartData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    http.Response response = await http.get(Uri.parse(HOST + CART), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      //  notifyListeners();
      _isLoading = false;
    } else {
      _isLoading = false;
      list = Cart.fromJson(json.decode(response.body));
      count = list.data.length;
      print(count);
      notifyListeners();
    }
  }

  Add() {
    count++;
  }

  Future<void> decreaseProduct(
    String id,
    String url,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    notifyListeners();
    var response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "id": id,
    });
    callAPIForCartData();
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
    } else {
      print(response.body);
      print(response.statusCode);
    }
    //notifyListeners();
  }

  Future<void> checkOut(
    city,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    notifyListeners();
    var response = await http
        .post(Uri.parse('https://marketlii.matsuda.website/api/add_order'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "address": city,
    });
    callAPIForCartData();
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      Get.to(ConfirmOrder());
      print(data);
    } else {
      CustomSnackBar().errorShowSnackBar(data['message']);
      print(response.body);
    }
    notifyListeners();
  }

  Future<void> addToCart(
    String id,
    String url,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    notifyListeners();
    var response = await http
        .post(Uri.parse('https://marketlii.matsuda.website/api/add_to_cart'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "id": id,
    });
    var data = json.decode(response.body);
    callAPIForCartData();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      print(data);
    } else {
      Fluttertoast.showToast(
          msg: data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(response.body);
      print(response.statusCode);
    }
  }
}

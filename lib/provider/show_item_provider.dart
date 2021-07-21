import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/showproduct_model.dart';

class ShowProductProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  ShowProduct _list;
  get getOneProductData => _list;
  Future<Null> callAPIForOneProductData(String id) async {
    _isLoading = true;
    http.Response response = await http.get(
      Uri.parse(HOST + SHOWPRODUCT + id),
    );
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      notifyListeners();
      _isLoading = false;
    } else {
      _list = ShowProduct.fromJson(json.decode(response.body));
      _isLoading = false;
      notifyListeners();
    }
  }
}

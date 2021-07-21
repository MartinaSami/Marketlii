import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/api_manager.dart';
import 'package:marketlii/model/product_by_category_model.dart';

class LEVEL_2 with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  var count;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  ProductByCategory _list;

  get getChildCategoryData => _list;

  Future<Null> callAPIForChildCategoryData(String id) async {
    _isLoading = true;
    http.Response response = await CallAPI()
        .getWithoutHeader('https://marketlii.matsuda.website/api/product/bycategory/$id');
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      notifyListeners();
      _isLoading = false;
    } else {
      _isLoading = false;
      _list = ProductByCategory.fromJson(json.decode(response.body));
      print(_list.data.length.toString());
      count = _list.data.length;
      print(count);
      notifyListeners();
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/categroy_model.dart';

class CategoryProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Category _list;
  get getCategoryData => _list;
  Future<Null> callAPIForCategoryData() async {
    //_isLoading = true;
    http.Response response = await http.get(
      Uri.parse(HOST + CATEGORY),
    );
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      _isLoading = false;
    } else {
      _list = Category.fromJson(json.decode(response.body));
      _isLoading = false;
      notifyListeners();
    }
  }
}

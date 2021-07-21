import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/api_manager.dart';
import 'package:marketlii/model/categroy_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LEVEL_3 with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  var count = 0;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Category _list;
  get getChildCategoryData => _list;
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name = sharedPreferences.getString('fname');
    return Text(name);
  }

  Future<Null> callAPIForChildCategoryData(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String lang = sharedPreferences.getString('lang');

    _isLoading = true;
    if (lang != null) {
      lang = sharedPreferences.getString('lang');
    } else {
      lang = 'en';
    }
    notifyListeners();

    http.Response response =
        await CallAPI().getWithoutHeader('https://marketlii.matsuda.website/api/category/$id');
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      notifyListeners();
      _isLoading = false;
      print(count);
    } else {
      _isLoading = false;
      _list = Category.fromJson(json.decode(response.body));
      print(count);
      notifyListeners();
    }
  }
}

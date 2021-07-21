import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Search _list;
  var count;
  get getSearchData => _list;
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name = sharedPreferences.getString('fname');
    return Text(name);
  }

  Future<Null> callAPIForSearchData(String text) async {
    // _isLoading = true;
    http.Response response = await http.get(
      Uri.parse(HOST + SEARCH + '/' + text),
    );
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      _isLoading = false;
    } else {
      _list = Search.fromJson(json.decode(response.body));
      _isLoading = false;
      count = _list.data.length;
      print(count);
      notifyListeners();
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/api_manager.dart';
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/rate_model.dart';
import 'package:marketlii/widget/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Rate list;

  var count;

  get getUserModelData => list;
  Future<Null> callAPIForRateData(String id) async {
    http.Response response = await http.get(
      Uri.parse(HOST + RATE + id),
    );
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      _isLoading = false;
    } else {
      _isLoading = false;
      list = Rate.fromJson(json.decode(response.body));
      count = list.data.length;
      notifyListeners();
    }
  }

  Future<Null> addRate(String id, rate, content, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = {"id": id, "rate": rate, "content": 'goog'};
    notifyListeners();
    var response = await CallAPI().post(HOST + ADDRATE, body, headers: headers);
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      print(token);
      Navigator.of(context).pop();
      CustomSnackBar().notErrorShowSnackBar(data['message']);
    } else {
      CustomSnackBar().errorShowSnackBar(data['message']);
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/slider_image.dart';

class SliderProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  SliderModel list;
  get getSliderData => list;
  Future<Null> callAPIForSliderData() async {
    http.Response response = await http.get(
      Uri.parse(HOST + SLIDER),
    );
    int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      _errorMessage =
          mapResponse['Message'] != null ? mapResponse['Message'] : "No";
      _isLoading = false;
    } else {
      list = SliderModel.fromJson(json.decode(response.body));
      _isLoading = false;
      notifyListeners();
    }
  }
}

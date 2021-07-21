import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/api_manager.dart';
import 'package:marketlii/model/profile_model.dart';
import 'package:marketlii/widget/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Profile list;

  var count;

  get getUserModelData => list;

  Future<Null> callAPIForUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    http.Response response = await http
        .get(Uri.parse('https://marketlii.matsuda.website/api/user'), headers: {
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
      list = Profile.fromJson(json.decode(response.body));
      notifyListeners();
    }
  }

  Future<Null> editProfileData(
      String name, mobile, address, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = {"name": name, "mobile": mobile, "address": address};
    notifyListeners();
    var response = await CallAPI().post(
        'https://marketlii.matsuda.website/api/user_edit', body,
        headers: headers);
    var data = json.decode(response.body);
    callAPIForUserData();
    print(data);
    if (response.statusCode == 200) {
      print(token);
      Navigator.of(context).pop();
    } else {
      CustomSnackBar().notErrorShowSnackBar(data['message']);
    }
  }

  Future<void> editPassword(String password, passwordCon) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    notifyListeners();
    var response = await http.post(
        Uri.parse('https://marketlii.matsuda.website/api/user_password'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          "password": password,
          "password_confirmation": password,
        });
    callAPIForUserData();
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      Get.back();
      CustomSnackBar().notErrorShowSnackBar(data['message']);
      print(data);
    } else {
      CustomSnackBar().errorShowSnackBar(data['message']);
      print(response.body);
      print(response.statusCode);
    }
    //notifyListeners();
  }
}

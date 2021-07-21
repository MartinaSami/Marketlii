import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/api/constant.dart';
import 'package:marketlii/model/favorite_model.dart';
import 'package:marketlii/provider/home_providers/product.dart';
import 'package:marketlii/widget/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider with ChangeNotifier {
  String isLogin;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  Favorite list;

  var count;

  get getFavoriteModelData => list;

  Future<Null> callAPIForFavoriteData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    isLogin = token;
    print(token);
    http.Response response =
        await http.get(Uri.parse(HOST + FAVORITE), headers: {
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
      list = Favorite.fromJson(json.decode(response.body));
      count = list.data.length;
      print(count);
      notifyListeners();
    }
  }

  Future<void> AddToFavorite(String id, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    print(token);
    notifyListeners();
    var response = await http
        .post(Uri.parse('https://marketlii.matsuda.website/api/add_favorite/$id'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "id": id,
    });
    Provider.of<ProductProvider>(context, listen: false)
        .callAPIForProductData();
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      CustomSnackBar().notErrorShowSnackBar(data['message']);
      print(data);
    } else {
      CustomSnackBar().errorShowSnackBar(data['message']);
      print(response.body);
      print(response.statusCode);
    }
  }

  Future<void> RemoveToFavorite(String id, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    notifyListeners();
    var response = await http
        .post(Uri.parse('https://marketlii.matsuda.website/api/remove_favorite/$id'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "id": id,
    });
    callAPIForFavoriteData();
    Provider.of<ProductProvider>(context, listen: false)
        .callAPIForProductData();
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      CustomSnackBar().notErrorShowSnackBar(data['message']);
      print(data);
    } else {
      CustomSnackBar().errorShowSnackBar(data['message']);
      print(response.body);
      print(response.statusCode);
    }
  }
}

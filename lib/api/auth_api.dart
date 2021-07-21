import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marketlii/screens/auth/login_view.dart';
import 'package:marketlii/view/main_screen.dart';
import 'package:marketlii/widget/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_manager.dart';
import 'constant.dart';

class Auth {
  ///this method for Login
  Future<Null> UserLogin(String email, password, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var body = {"email": email, "password": password};
    var response = await CallAPI().post(
      HOST + LOGIN,
      body,
    );
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      String token = data['token'];
      sharedPreferences.setString('token', token);
      print(token);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      CustomSnackBar().errorShowSnackBar(data['message']);
    }
  }

  Future<Null> UserRegister(
      String name, email, password, mobile, BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var body = {
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
      "password confirmation": password
    };
    var response = await CallAPI().post(
      HOST + REGISTER,
      body,
    );
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      String token = data['token'];
      sharedPreferences.setString('token', token);
      print(token);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      CustomSnackBar().errorShowSnackBar(data['errors'].toString());
    }
  }

  ///this method for ForgetPassword
  Future<Null> UserForgetPassword(
    String email,
    BuildContext context,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var body = {
      "email": email,
    };
    var response = await CallAPI().post(
      FORGOTPASS,
      body,
    );
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      String token = data['data']['api_token'];
      sharedPreferences.setString('toekn', token);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginView()));
    } else {
      CustomSnackBar().errorShowSnackBar(data['message'].toString());
    }
  }

  Future<Null> logOut(
      BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');

    var response = await http.post(Uri.parse('https://marketlii.matsuda.website/api/logout'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      sharedPreferences.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginView()));
    }
  }

  Future<Null> userLogout(
    BuildContext context,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var response = await http.post(
      Uri.parse('https://marketlii.matsuda.website/api/logout'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      sharedPreferences.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginView()));
      CustomSnackBar().notErrorShowSnackBar(data['message']);
    } else {
      CustomSnackBar().errorShowSnackBar(data['message']);
    }
  }

  Future<Null> UpdateProfile(
    String name,
    email,
    mobile,
    password,
    passwordConfirmation,
    BuildContext context,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    var body = {
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "branch_id": 1.toString(),
      'role': 1.toString()
    };
    var header = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };
    var response = await CallAPI().put(
      LOGIN,
      header,
      body,
    );
    if (response.statusCode == 200) {
    } else {}
  }
}

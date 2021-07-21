import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//this class to call api
class CallAPI {
  get(String url, headers) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String basaCode = sharedPreferences.getString('basaCode');
    http.Response response =
        await http.get(Uri.parse(basaCode + '/' + url), headers: headers);
    return json.decode(response.body);
  }

  dynamic getWithoutHeader(String url) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String basaCode = sharedPreferences.getString('basaCode');
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }

  post(String url, data, {dynamic headers}) async {
    var response =
        await http.post(Uri.parse(url), body: data, headers: headers);
    return response;
  }

  put(String url, var data, headers) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String basaCode = sharedPreferences.getString('basaCode');
    var response = await http.put(Uri.parse(basaCode + '/api/users/1'),
        body: data, headers: headers);
    return response;
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Modal/HomeModal.dart';

class HomeProvider extends ChangeNotifier {
  String lan = "21.1592002";
  String lon = "72.8222963";

  void changeWeather(String wlan, String wlon) {
    lan = wlan;
    lon = wlon;
    notifyListeners();
  }

  Future<HomeModal> fact(String clan, String clon) async {
    var jsonstring = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$clan&lon=$clon&appid=9628b95a2235abb2f18055013ade5de8'));
    var json = jsonDecode(jsonstring.body);

    return HomeModal.fromJson(json);
  }
}

import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:query_params/query_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "https://developers.zomato.com/api/v2.1/";
const token = "1e3c349cc25d35cea4a89cf86995cd6b"; // need to store sharedPreferences normally after login

class API {

  static Future customerFeedback(String jsonRequest) {

    var url = baseUrl + "Customer_Feedback";
    print(url);
    var response = http.post(url, body: jsonRequest, headers: {
      "Accept": "application/json",
      "Content-type": "application/json",
//      "token": sharedPreferences.getString("Token")
    });
    return response;
  }

  static Future getCategories() async {
    var url = baseUrl + "categories";
    print(url);
    return http.get(url, headers: {
      "Accept": "application/json",
      "user-key": token
    });
  }

  static Future getSearch(double lat, double lon, int count, double radius, String sort, int start) async {

    URLQueryParams queryParams = new URLQueryParams();
    queryParams.append('lat', lat);
    queryParams.append('lon', lon);
    queryParams.append('count', count);
    queryParams.append('radius', radius);
    queryParams.append('sort', sort);
    queryParams.append('start', start);

    var url = baseUrl + "search?" + queryParams.toString();
    print(url);
    var response = http.get(url, headers: {
      "Accept": "application/json",
      "Content-type": "application/json",
      "user-key": token
    });

    return response;
  }
//
}

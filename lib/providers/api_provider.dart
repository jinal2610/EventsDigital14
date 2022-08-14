
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIProvider extends ChangeNotifier {

  Future<dynamic> getDataObject(String apiUrl, Map<String, dynamic>? parameters) async {

    try {

      final response = await http.get(
        parameters != null ? Uri.parse(apiUrl).replace(queryParameters: parameters) : Uri.parse(apiUrl),
      );

      print(Uri.parse(apiUrl).replace(queryParameters: parameters));

      print("response");
      print(response.statusCode.toString());
      print(response.body.toString());

      return jsonDecode(response.body.toString());
    }
    on HttpException {
      return Future.error("No Internet");
    }
    on FormatException {
      return Future.error("Invalid Format");
    }
    on SocketException {
      return Future.error("Internet not connected");
    }
    catch (e) {
      return Future.error("Unknown Error");
    }
  }
}
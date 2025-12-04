import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AddApiData {
  static Future<void> AddSorreData({required quote, required author}) async {
    try {
      Uri a = Uri.parse("https://appapi.coderangon.com/api/quotations");

      var header = {"Accept": "application/json"};
      var body = {
        "category_id": "4",
        "quote": quote,
        "author": author,
      };
      
      var response = await http.post(a,headers: header,body: body);
      log("====${response.statusCode}===");
    } catch (e) {
      log("=======Error====$e==");
    }
  }
}

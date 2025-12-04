import 'dart:developer';

import 'package:http/http.dart' as http;

class QuotationsDelete {
  static Future<void> DeletedData({required id}) async {
    try {
      Uri url = Uri.parse("https://appapi.coderangon.com/api/quotations/$id");
      var response = await http.delete(url);
      log("${response.statusCode}");
    } catch (e) {
      log("==========Error++: ${e}");
    }
  }
}


import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiMoti {

  getDataMotiApi() async {
    var url = Uri.parse("https://playstore.citsolution.xyz/api/slider");
    var response = await http.get(url);

    //print("=================${response.body}============");

   return jsonDecode(response.body);

  }

}
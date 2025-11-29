import 'dart:convert';

import 'package:http/http.dart' as http;

class Api{

   getDataApi() async{

    var url = Uri.parse("https://playstore.citsolution.xyz/api/slider");
    var response = await http.get(url);
    //print("Status Code: ${jsonDecode(response.body)}");

    return jsonDecode(response.body);

  }
}

import 'dart:developer';

import 'package:http/http.dart' as http;
class UpdateQuatons{

  static Future<void> UpdateData({required int id,required quote,required author})async{
    try{
      Uri url = Uri.parse("https://appapi.coderangon.com/api/quotations/$id");

      var header = {"Accept": "application/json"};
      var body = {
        "category_id": "4",
        "quote": quote,
        "author": author,
      };

      var response = await http.put(url,headers: header,body: body);
      log("=======================");
      log("${response.statusCode}======UPdated============");
    }
        catch(e){
      log("===========Errror :${e}");
        }

  }

}
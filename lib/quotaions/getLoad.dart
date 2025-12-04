

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiData {

 Future<Map> getApiLoad() async {

   try{
        Uri a = Uri.parse("https://appapi.coderangon.com/api/quotations/4");
        var response = await http.get(a);

        return jsonDecode(response.body);
     //   log("=========${response.body}");
   }
   catch(e){
     log("Root of Error : $e");
   }
   return{};

 }


}
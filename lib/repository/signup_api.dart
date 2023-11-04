import 'dart:convert';
import 'package:cars/app_config/app_urls.dart';
import 'package:http/http.dart' as http;

import '../app_config/sp.dart';
class SignUpApiClass{
  static String? msg;

  static Future registerCall(payload) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppUrl.addReg),body: json.encode(payload),headers: {'Content-Type': 'application/json'});
      if(response.statusCode == 200){
        print("Success Case");
        return true;
      }else{
        print("Failure Case");
        return false;
      }
     // List result = jsonDecode(response.body);
    } catch (e) {
      print("Exception");
      return false;
    }
  }

  static Future<String> signInCall(payload) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppUrl.login),body: json.encode(payload),headers: {'Content-Type': 'application/json'});
      if(response.statusCode == 200){
        print("Success Case");
        await sp.saveData("AUTH_RES", response.body, SharedPreferenceIOType.stringType);
        await sp.saveData("AUTH_TOKEN", json.decode(response.body)['authToken'], SharedPreferenceIOType.stringType);
        await sp.saveData("ID", json.decode(response.body)['id'], SharedPreferenceIOType.integerType);
        await sp.updateSpValues();
        return response.body;
      }else{
        print("Failure Case");
        msg = response.body;
        return "";
      }
      // List result = jsonDecode(response.body);
    } catch (e) {
      print("Exception");
      msg = "Exception Occurred";
      return "";
    }
  }


}
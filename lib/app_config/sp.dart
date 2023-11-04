import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/signin_user_data.dart';
SPInfo sp = SPInfo();
enum SharedPreferenceIOType{
  stringType,integerType,boolType,doubleType
}
class SPInfo {

  SharedPreferences? _sharedPreferences;

  getData(String key, SharedPreferenceIOType type) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    if (type == SharedPreferenceIOType.stringType) {
      return _sharedPreferences?.getString(key) ?? '';
    }
    else if (type == SharedPreferenceIOType.integerType) {
      return _sharedPreferences?.getInt(key) ?? -1;
    } else if (type == SharedPreferenceIOType.boolType) {
      return _sharedPreferences?.getBool(key) ?? false;
    } else if (type == SharedPreferenceIOType.doubleType) {
      return _sharedPreferences?.getDouble(key) ?? 0.0;
    }
  }

  saveData(String key, value, type) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    if (type == SharedPreferenceIOType.stringType) {
      await _sharedPreferences?.setString(key, value??"");
    } else if (type == SharedPreferenceIOType.integerType) {
      await _sharedPreferences?.setInt(key, value ?? -1);
    } else if (type == SharedPreferenceIOType.boolType) {
      await _sharedPreferences?.setBool(key, value ?? false);
    } else if (type == SharedPreferenceIOType.doubleType) {
      await _sharedPreferences?.setDouble(key, value ?? 0.0);
    }
  }

  clearStorage() {
    _sharedPreferences?.clear();
  }

  updateSpValues()async{
    AppLoginUserData.loginData = jsonDecode(await getData("AUTH_RES", SharedPreferenceIOType.stringType)) ;
    AppLoginUserData.authToken =  await getData("AUTH_TOKEN", SharedPreferenceIOType.stringType);
    AppLoginUserData.id = await getData("ID", SharedPreferenceIOType.integerType);

  }
}
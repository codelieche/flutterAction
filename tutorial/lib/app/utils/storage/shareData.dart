// SharedPreferences 存储和读取字符操作

import 'package:shared_preferences/shared_preferences.dart';

// 设置SharedPreferences的数据
Future<bool> setSharePreferencesString(String key, String value) async {
  // 判断值是否正确
  if (key is String && key != "" && value is String) {
    // 执行存储操作
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 设置数据
    return await prefs.setString(key, value);
  } else {
    return false;
  }
}

// 从SharedPreferences中读取数据
Future<String> getSharedPreferencesString(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // 得到数据
  String value = prefs.getString(key);
  if (value != null && value != "") {
    return value;
  } else {
    return "";
  }
}

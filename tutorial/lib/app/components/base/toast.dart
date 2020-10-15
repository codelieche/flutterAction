// 弹出FlutterToast消息: 在fluttertoast的基础上进行封装
// Fluttertoast示例
// Fluttertoast.showToast(
//   msg: "消息内容",
//   toastLength: Toast.LENGTH_SHORT,
//   timeInSecForIosWeb: 3,
//   backgroundColor: Colors.green,
//   textColor: Colors.white,
//   fontSize: 14.0,
//   gravity: ToastGravity.BOTTOM, // 消息位置
// );

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

export "package:fluttertoast/fluttertoast.dart";

// Tooast消息类型
enum ToastMessageType {
  message,
  info,
  warning,
  success,
  error,
  fail,
}

// 显示消息函数
showToastMessage(
  String msg, {
  ToastMessageType type = ToastMessageType.message, // 默认的消息类型是:message
  ToastGravity gravity = ToastGravity.BOTTOM, // 默认的位置是底部
}) {
  // 对传入的内容做判断：如果传入的msg是null，程序是会直接崩溃的
  if (msg == null || msg == "") {
    msg = "No Message";
  }

  // 颜色
  Color backgroundColor;
  Color textColor = Colors.white;
  switch (type) {
    case ToastMessageType.message:
      backgroundColor = Colors.green[600];
      // break;
      break;
    case ToastMessageType.info:
      backgroundColor = Colors.orange[600];
      textColor = Colors.white;
      break;
    case ToastMessageType.warning:
      backgroundColor = Colors.deepOrange;
      textColor = Colors.white;
      break;
    case ToastMessageType.success:
      backgroundColor = Colors.green;
      textColor = Colors.white;
      break;
    case ToastMessageType.error:
      backgroundColor = Colors.red[400];
      break;
    case ToastMessageType.fail:
      backgroundColor = Colors.red;
      break;
  }

  Fluttertoast.showToast(
    msg: msg, // 消息内容，字符型
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 3,
    backgroundColor: backgroundColor, // 背景颜色
    fontSize: 14.0, // 字体大小
    gravity: gravity,
    textColor: textColor, // 文本颜色
  );
}

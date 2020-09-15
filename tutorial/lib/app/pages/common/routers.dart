// 所有常用功能的路由配置
// import 'package:flutter/material.dart';

// 功能页面
import 'storage/index.dart';
// 照片、相机
import 'imagePicker/index.dart';
// webview
import 'webview/index.dart';
// 打开外部应用
import 'urllancher/index.dart';

// 配置的路由
Map<String, Function> commonRoutes = {
  // image
  "/common/imagepicker/index": (context) => ImagePickerIndexPage(),
  // webView
  "/common/webview/index": (context) => WebViewIndexPage(),
  // 存储
  "/common/storage/index": (context) => StorrageIndexPage(),
  // 打开外部应用
  "/common/urllancher/index": (context) => UrlLancherIndexPage(),
};

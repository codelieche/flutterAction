// 所有页面的路由配置
// import 'package:flutter/material.dart';

import 'test1.dart';

// 错误页面
import 'errors/403.dart';
import 'errors/404.dart';
import 'errors/50x.dart';

// 配置的路由
Map<String, Function> pageRoutes = {
  "/page/001": (content) => Page001(),
  // 错误页
  "/page/error/403": (context) => ErrorPage403(),
  "/page/error/404": (context) => ErrorPage404(),
  "/page/error/50x": (context) => ErrorPage50x(),
};

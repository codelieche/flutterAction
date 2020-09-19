// 所有页面的路由配置
// import 'package:flutter/material.dart';

import 'test1.dart';

// 用户页
import 'user/index.dart';

// 屏幕适配
import 'screenadapter/index.dart';

// 下拉刷新、上拉加载
import 'reFreshReload/index.dart';

// 错误页面
import 'errors/403.dart';
import 'errors/404.dart';
import 'errors/50x.dart';

// 配置的路由
Map<String, Function> pageRoutes = {
  // 示例页面001
  "/page/001": (content) => Page001(),

  // 下拉刷新上拉加载
  "/page/refreshreload/index": (context) => ReFreshReloadIndexPage(),

  // 用户页
  "/page/user/index": (context) => UserIndexPage(),

  // 屏幕适配
  "/page/screenadapter/index": (context) => ScreenAdapterIndexPage(),

  // 错误页
  "/page/error/403": (context) => ErrorPage403(),
  "/page/error/404": (context) => ErrorPage404(),
  "/page/error/50x": (context) => ErrorPage50x(),
};

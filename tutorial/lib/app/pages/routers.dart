/**
 * 所有页面的路由配置
 */
import 'package:flutter/material.dart';

import 'tabs.dart';
import 'home/index.dart';
import 'widget/index.dart';
// import 'page/pageDemoThirdIndex.dart';
import 'user/index.dart';

// 引入子路由
import 'widget/routers.dart';
import 'common/routers.dart';
import "page/routers.dart";
import 'third/routers.dart';

// 配置的路由

Map<String, Function> routes = {
  "/": (content, {int arguments}) =>
      AppHomeTabs(currentIndex: arguments != null ? arguments : 0),
  "/home": (context) => HomeIndexPage(),
  "/widget": (context) => WidgetIndexPage(),
  // "/page": (context) => PageDemoThirdIndexPage(),
  "/user": (context) => UserIndexPage(),
};

var addAllRoutesLock = false; // 添加路由的锁
// 子页面路由：方便管理
List<Map<String, Function>> subRoutes = [
  widgetRoutes,
  commonRoutes,
  pageRoutes,
  thridRoutes,
];

Function onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name; // 路由配置中的名字，比如：/home
  // print(name);

  if (!addAllRoutesLock) {
    // print("合并一下路由");
    subRoutes.forEach((subRoutes) {
      routes.addAll(subRoutes);
    });

    // 把锁设置为true
    addAllRoutesLock = true;
  }

  // 路由去的页面的构造函数
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(builder: (context) {
        return pageContentBuilder(context, arguments: settings.arguments);
      });
      return route;
    } else {
      final Route route = MaterialPageRoute(builder: (context) {
        return pageContentBuilder(context);
      });
      return route;
    }
  } else {
    // 显示404页面：不配置个404，当程序中push到不存在的页面，会输出很多错误
    return MaterialPageRoute(builder: (context) {
      // 从routes中没找到
      var notFoundPage = Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("404"),
        ),
        body: Center(
          child: Text("404 Page"),
        ),
      );

      return notFoundPage;
    });
  }
};

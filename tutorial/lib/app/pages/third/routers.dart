// 第三方库相关示例路由

// 引入库
import 'dio/index.dart';
import 'slidable/index.dart';

Map<String, Function> thridRoutes = {
  "/third/dio/index": (context) => DioDemoIndexPage(),
  "/third/flutter_slidable/index": (context) => FlutterSlidableIndexPage(),
};

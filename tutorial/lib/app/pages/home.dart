/**
 * App的首页
 * 主要是包含了底部的导航，以及各导航指向啥页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tutorial/app/variables.dart';

// 路由
import 'routers.dart';

// 监听事件
import '../utils/events/eventBus.dart';
// 引入fetchApi
import '../utils/fetchApi/base.dart';
// 引入错误页
import '../pages/page/errors/404.dart';
import '../pages/page/errors/403.dart';
import '../pages/page/errors/50x.dart';

// 过渡页之后的App首页
class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  void initState() {
    super.initState();

    // 实例化fetchApi
    initFetchApi();

    // 监听事件
    this.listenEvents();
  }

  listenEvents() {
    // 监听FetchApiError事件
    eventBus.on<FetchApiError>().listen(
      (event) {
        // 想用pushNamed，但是push不成功
        // print("出现了错误：${event.code}");
        switch (event.code) {
          case 401:
            {
              // 需要跳转去登录页面
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ErrorPage403();
              }));
              break;
            }
          case 403:
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ErrorPage403();
              }));
              break;
            }
          case 404:
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ErrorPage404();
              }));
              break;
            }
          case 500:
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ErrorPage50x();
              }));
              break;
            }
          default:
            {
              print(event.code);
              break;
            }
        }
        return;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 返回
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 默认是true，是否在模拟器右上角显示个debug标识
      theme: ThemeData(
        primaryColor: AppPrimaryColor,
      ),
      // home: homeScaffold,
      initialRoute: "/", // 初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("zh", "CH"),
        const Locale("en", "US"),
      ],
      locale: Locale("zh"),
    );
  }
}

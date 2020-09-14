import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//引入过渡页
import 'splash/base.dart';

// App主程序：进入过渡页-->Home页面
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 返回
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "编程列车",
      theme: ThemeData(
//        primarySwatch: Colors.lightBlue,
        primaryIconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(74, 144, 226, 1),
//        primaryColor: Colors.red,
//        accentColor: Colors.cyan[300],
      ),
      home: BaseSplashPage(),

      // 语言国际化: 配置语言
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}

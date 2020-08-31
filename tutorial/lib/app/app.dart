import 'package:flutter/material.dart';

//引入过渡页
import 'splash/base.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

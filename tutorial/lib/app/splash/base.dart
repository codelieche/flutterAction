/**
 * 基本的过渡页
 */
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

// 引入首页
import 'package:tutorial/app/pages/home.dart';
import '../variables.dart';

// app启动基本过渡页
class BaseSplashPage extends StatefulWidget {
  @override
  _BaseSplashPageState createState() => _BaseSplashPageState();
}

class _BaseSplashPageState extends State<BaseSplashPage> {
  // 计时器
  Timer _t;

  // 初始化状态
  @override
  void initState() {
    super.initState();
    // 初始化定时器
    _t = new Timer(const Duration(milliseconds: 2000), () {
      // 2秒钟之后，跳转主页
      print("Hello splash");
      try {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => AppHomePage(),
            ),
            (route) => route == null);
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: Color.fromRGBO(74, 144, 226, 1),
      color: AppPrimaryColor,
      child: Padding(
          padding: EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Text("编程列车",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              Container(
                height: 10,
              ),
              Text(
                "flutter tutorial",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )
            ],
          )),
    );
  }
}

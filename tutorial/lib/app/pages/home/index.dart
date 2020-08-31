
import 'package:flutter/material.dart';


class HomeIndexPage extends StatefulWidget {
  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  @override
  Widget build(BuildContext context) {
    print("home index build!");
    return Scaffold(
      appBar: AppBar(
        title: Text("运维平台"),
      ),
      body: Center(                      // 当前页的主页
        child: Text("Hello Home Page"),      // 页面的主体内容
      ),
    );
  }
}

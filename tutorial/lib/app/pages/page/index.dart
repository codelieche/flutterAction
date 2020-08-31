
import 'package:flutter/material.dart';

class PageDemoIndexPage extends StatefulWidget {
  @override
  _PageDemoIndexPageState createState() => _PageDemoIndexPageState();
}

class _PageDemoIndexPageState extends State<PageDemoIndexPage> {

  // 脚手架
  Scaffold scaffold = Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.pinkAccent,
      title: Text("页面示例", style: TextStyle(color: Colors.white),),
      elevation: 0.0,  // 阴影，默认是4.0
    ),
    body: Center(
      child: Text("页面示例"),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: scaffold,
    );
  }
}

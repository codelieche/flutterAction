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
        title: Text("编程列车"),
      ),
      body: Center(
          // 当前页的主页
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Home Page"),
        RaisedButton(
          child: Text("跳转到用户页"),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            // 点击事件
            Navigator.pushReplacementNamed(context, "/", arguments: 3);
          },
        )
      ])),
    );
  }
}

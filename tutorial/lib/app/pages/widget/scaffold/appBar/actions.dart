// 给顶部导航加入右侧按钮
import 'package:flutter/material.dart';

class ScaffoldAppBarAcitonsDemo extends StatefulWidget {
  ScaffoldAppBarAcitonsDemo({Key key}) : super(key: key);

  @override
  _ScaffoldAppBarAcitonsDemoState createState() =>
      _ScaffoldAppBarAcitonsDemoState();
}

class _ScaffoldAppBarAcitonsDemoState extends State<ScaffoldAppBarAcitonsDemo> {
  String _msg = "请点击右侧的按钮";

  @override
  Widget build(BuildContext context) {
    // 页面主体内容
    Widget body = Center(
      child: Text(_msg),
    );

    // 脚手架
    return Scaffold(
      appBar: AppBar(
        title: Text("设置 ictions"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _msg += ";delete被点击了";
                });
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _msg += ";search被点击了";
                });
              }),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _msg += ";add被点击了";
                });
              })
        ],
      ),
      body: body,
    );
  }
}

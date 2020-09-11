// 设置顶部导航左侧的按钮
import 'package:flutter/material.dart';

class ScaffoldAppBarLeadingDemo extends StatefulWidget {
  ScaffoldAppBarLeadingDemo({Key key}) : super(key: key);

  @override
  _ScaffoldAppBarLeadingDemoState createState() =>
      _ScaffoldAppBarLeadingDemoState();
}

class _ScaffoldAppBarLeadingDemoState extends State<ScaffoldAppBarLeadingDemo> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("返回"),
        ),
      ],
    );

    // 脚手架
    return Scaffold(
      appBar: AppBar(
        title: Text("设置左侧菜单"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print("左侧按钮被点击");
          },
        ),
      ),
      body: body,
    );
  }
}

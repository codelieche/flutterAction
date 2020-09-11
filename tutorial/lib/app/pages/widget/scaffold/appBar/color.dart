// 设置appBar的颜色
import 'package:flutter/material.dart';

class ScaffoldAppBarSetColorDemo extends StatefulWidget {
  ScaffoldAppBarSetColorDemo({Key key}) : super(key: key);

  @override
  _ScaffoldAppBarSetColorDemoState createState() =>
      _ScaffoldAppBarSetColorDemoState();
}

class _ScaffoldAppBarSetColorDemoState
    extends State<ScaffoldAppBarSetColorDemo> {
  Color _currentColor = Colors.pinkAccent;
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        // liteBlue
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            color: Colors.lightBlue,
          ),
          title: Text("liteBlue", style: TextStyle(color: Colors.lightBlue)),
          onTap: () {
            setState(() {
              _currentColor = Colors.lightBlue;
            });
          },
        ),
        Divider(),

        // pinkAccent
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            color: Colors.pinkAccent,
          ),
          title: Text("pinkAccent", style: TextStyle(color: Colors.pinkAccent)),
          onTap: () {
            setState(() {
              _currentColor = Colors.pinkAccent;
            });
          },
        ),
        Divider(),

        // purpleAccent
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            color: Colors.purpleAccent,
          ),
          title: Text("purpleAccent",
              style: TextStyle(color: Colors.purpleAccent)),
          onTap: () {
            setState(() {
              _currentColor = Colors.purpleAccent;
            });
          },
        ),
        Divider(),

        // green
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            color: Colors.green,
          ),
          title: Text("green", style: TextStyle(color: Colors.green)),
          onTap: () {
            setState(() {
              _currentColor = Colors.green;
            });
          },
        ),
        Divider(),

        // orangeAccent
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            color: Colors.orangeAccent,
          ),
          title: Text("liteBlue", style: TextStyle(color: Colors.orangeAccent)),
          onTap: () {
            setState(() {
              _currentColor = Colors.orangeAccent;
            });
          },
        ),
        Divider(),

        // red
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            color: Colors.red,
          ),
          title: Text("red", style: TextStyle(color: Colors.red)),
          onTap: () {
            setState(() {
              _currentColor = Colors.red;
            });
          },
        ),
        Divider(),
      ],
    );

    // 脚手架页面
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _currentColor, // 背景颜色
        title: Text("设置颜色"),
      ),
      body: body,
    );
  }
}

// SnackBar Base Demo
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class SnackBarBaseDemo extends StatefulWidget {
  SnackBarBaseDemo({Key key}) : super(key: key);

  @override
  _SnackBarBaseDemoState createState() => _SnackBarBaseDemoState();
}

class _SnackBarBaseDemoState extends State<SnackBarBaseDemo> {
  @override
  Widget build(BuildContext context) {
    // 页面主体内容
    Widget body = Column(children: [
      // 基本使用
      SimpleTitleWidget(
          title: "基本使用", description: "Scaffold.of(context).showSnackBar"),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Hello SnackBar"),
              ));
            },
            child: Text("弹出文本"),
          ),
          RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.pinkAccent,
                content: Image.asset("asserts/images/codelieche-blue.png"),
              ));
            },
            child: Text("弹出图片"),
          ),
          RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Container(
                  height: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.arrow_right),
                          title: Text("codelieche"),
                        ),
                        ListTile(
                          leading: Icon(Icons.arrow_right),
                          title: Text("编程列车"),
                        )
                      ],
                    ),
                  ),
                ),
              ));
            },
            child: Text("弹出Column"),
          ),
        ],
      ),

      // 设置背景颜色
      SimpleTitleWidget(
          title: "设置背景颜色", description: "SnackBar.backgroundColor"),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Hello SnackBar"),
              ));
            },
            child: Text("默认颜色"),
          ),
          RaisedButton(
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.pinkAccent,
                content: Text("Hello SnackBar"),
              ));
            },
            child: Text("pinkAccount"),
          ),
          RaisedButton(
            color: Colors.lightBlue,
            textColor: Colors.white,
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.lightBlue,
                content: Text("Hello SnackBar"),
              ));
            },
            child: Text("lightBlue"),
          ),
        ],
      ),
    ]);
    return body;
  }
}

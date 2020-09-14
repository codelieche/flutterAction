import 'package:flutter/material.dart';

// 示例页面首页
class PageIndexPage extends StatefulWidget {
  @override
  _PageIndexPageState createState() => _PageIndexPageState();
}

class _PageIndexPageState extends State<PageIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/page/error/404");
        },
        child: Text("演示404"),
      ),
    );

    // 返回
    return body;
  }
}

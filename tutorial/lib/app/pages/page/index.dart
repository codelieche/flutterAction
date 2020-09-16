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
    Widget body = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.pushNamed(context, "/page/error/404");
          },
          title: Text("演示404"),
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.pushNamed(context, "/page/user/index");
          },
          title: Text("用户相关页"),
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.pushNamed(context, "/page/screenadapter/index");
          },
          title: Text("屏幕适配"),
        )
      ],
    );

    // 返回
    return body;
  }
}

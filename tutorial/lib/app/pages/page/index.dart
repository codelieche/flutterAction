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
            Navigator.pushNamed(context, "/page/error/index");
          },
          title: Text("401/403/404/50x错误页"),
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
            Navigator.pushNamed(context, "/page/menus/index");
          },
          title: Text("菜单、分类页"),
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.pushNamed(context, "/page/refreshreload/index");
          },
          title: Text("下拉刷新、上拉加载"),
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.pushNamed(context, "/page/screenadapter/index");
          },
          title: Text("屏幕适配"),
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.pushNamed(context, "/page/other/index");
          },
          title: Text("其它"),
        )
      ],
    );

    // 返回
    return body;
  }
}

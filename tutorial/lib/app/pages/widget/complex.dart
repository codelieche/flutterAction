/**
 * 复杂组件相关的实例
 */
import 'package:flutter/material.dart';

class ComplexWidgetIndexPage extends StatefulWidget {
  @override
  _ComplexWidgetIndexPageState createState() => _ComplexWidgetIndexPageState();
}

class _ComplexWidgetIndexPageState extends State<ComplexWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      // Scaffold:
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Scaffold: 脚手架"),
        onTap: () {
          // 跳转去Column首页
          Navigator.pushNamed(context, "/widget/scaffold/index");
        },
      ),
      Divider(),

      // Dialog
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Dialog: 会话框"),
        onTap: () {
          // 跳转去Column首页
          Navigator.pushNamed(context, "/widget/dialog/index");
        },
      ),
      Divider(),
    ];

    // 返回个列表容器
    return ListView(
      children: widgetList,
    );
  }
}

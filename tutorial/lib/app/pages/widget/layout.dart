// 布局相关的组件示例首页
import 'package:flutter/material.dart';

class LayoutWidgetIndexPage extends StatefulWidget {
  @override
  _LayoutWidgetIndexPageState createState() => _LayoutWidgetIndexPageState();
}

class _LayoutWidgetIndexPageState extends State<LayoutWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> layoutList = [
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Container: 容器"),
        onTap: () {
          // 跳转去容器首页
          Navigator.pushNamed(context, "/widget/container/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Row: 行"),
        onTap: () {
          // 跳转去Row首页
          Navigator.pushNamed(context, "/widget/row/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Column: 列"),
        onTap: () {
          // 跳转去Column首页
          Navigator.pushNamed(context, "/widget/column/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Wrap: 包裹"),
        onTap: () {
          // 跳转去Wrap首页
          Navigator.pushNamed(context, "/widget/wrap/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Expanded: 扩展"),
        onTap: () {
          // 跳转去Expanded首页
          Navigator.pushNamed(context, "/widget/expanded/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Stack: 层叠"),
        onTap: () {
          // 跳转去Stack首页
          Navigator.pushNamed(context, "/widget/stack/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Positioned: 绝对位置"),
        onTap: () {
          // 跳转去Positioned首页
          Navigator.pushNamed(context, "/widget/positioned/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("Card: 卡片"),
        onTap: () {
          // 跳转去card首页
          Navigator.pushNamed(context, "/widget/card/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("ExpansionTile: 展开、闭合"),
        onTap: () {
          // 跳转去展开、闭合首页
          Navigator.of(context).pushNamed("/widget/expansiontile/index");
        },
      ),
      Divider(height: 1),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("other: 其它"),
        onTap: () {
          // 跳转去Wrap首页
          Navigator.pushNamed(context, "/widget/other/layout/index");
        },
      ),
    ];
    return ListView(
      children: layoutList,
    );
  }
}

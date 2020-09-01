/**
 * 布局相关的组件示例首页
 *
 */
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
        leading: IconButton(
          icon: Icon(Icons.arrow_right),
        ),
        title: Text("Container: 容器"),
        onTap: (){
          // 跳转去容器首页
          Navigator.pushNamed(context, "/widget/container/index");
        },
      ),

      Divider(),

      ListTile(
        leading: IconButton(
          icon: Icon(Icons.arrow_right),
        ),
        title: Text("Row: 行"),
        onTap: (){
          // 跳转去Row首页
          Navigator.pushNamed(context, "/widget/row/index");
        },
      ),

      Divider(),

      ListTile(
        leading: IconButton(
          icon: Icon(Icons.arrow_right),
        ),
        title: Text("Column: 列"),
        onTap: (){
          // 跳转去Column首页
          Navigator.pushNamed(context, "/widget/column/index");
        },
      ),

      Divider(),

      ListTile(
        leading: IconButton(
          icon: Icon(Icons.arrow_right),
        ),
        title: Text("Wrap: 包裹"),
        onTap: (){
          // 跳转去Wrap首页
          Navigator.pushNamed(context, "/widget/wrap/index");
        },
      ),

      Divider(),

      ListTile(
        leading: IconButton(
          icon: Icon(Icons.arrow_right),
        ),
        title: Text("Stack: 层叠"),
        onTap: (){
          // 跳转去Stack首页
          Navigator.pushNamed(context, "/widget/stack/index");
        },
      ),

      Divider(),

      ListTile(
        leading: IconButton(
          icon: Icon(Icons.arrow_right),
        ),
        title: Text("Positioned: 绝对位置"),
        onTap: (){
          // 跳转去Positioned首页
          Navigator.pushNamed(context, "/widget/positioned/index");
        },
      ),

      Divider(),

      ListTile(
        leading: IconButton(
          icon: Icon(Icons.arrow_right),
        ),
        title: Text("Card: 卡片"),
        onTap: (){
          // 跳转去card首页
          Navigator.pushNamed(context, "/widget/card/index");
        },
      ),

    ] ;
    return ListView(
      children: layoutList,
    );
  }
}

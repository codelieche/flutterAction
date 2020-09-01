
import 'package:flutter/material.dart';

class SimpleWidgetPage extends StatefulWidget {
  @override
  _SimpleWidgetPageState createState() => _SimpleWidgetPageState();
}

class _SimpleWidgetPageState extends State<SimpleWidgetPage> {
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        ListTile(
          leading: IconButton(
            icon: Icon(Icons.text_fields),
          ),
          title: Text("Text: 文本组件"),
          onTap: (){
            // 跳转去文本组件的首页
            Navigator.pushNamed(context, "/widget/text/index");
          },
        ),

        Divider(),

        ListTile(
          leading: IconButton(
            icon: Icon(Icons.image),
          ),
          title: Text("Image: 图片组件"),
          onTap: (){
            // 跳转去图片组件的首页
            Navigator.pushNamed(context, "/widget/image/index");
          },
        ),

        Divider(),

        ListTile(
          leading: IconButton(
            icon: Icon(Icons.radio_button_checked),
          ),
          title: Text("Button: 按钮组件"),
          onTap: (){
            // 跳转去按钮组件的首页
            Navigator.pushNamed(context, "/widget/button/index");
          },
        ),

        Divider(),

        ListTile(
          leading: IconButton(
            icon: Icon(Icons.list),
          ),
          title: Text("ListView: 列表组件"),
          onTap: (){
            // 跳转去ListView组件的首页
            Navigator.pushNamed(context, "/widget/listview/index");
          },
        ),

        Divider(),

        ListTile(
          leading: IconButton(
            icon: Icon(Icons.grid_on),
          ),
          title: Text("GridView: 网格组件"),
          onTap: (){
            // 跳转去网格组件首页
            Navigator.pushNamed(context, "/widget/gridview/index");
          },
        )

      ],
    );
  }
}

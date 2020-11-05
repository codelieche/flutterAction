// 其它组件页面
import 'package:flutter/material.dart';

class OtherWidgetIndexPage extends StatefulWidget {
  OtherWidgetIndexPage({Key key}) : super(key: key);

  @override
  _OtherWidgetIndexPageState createState() => _OtherWidgetIndexPageState();
}

class _OtherWidgetIndexPageState extends State<OtherWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 内容
    Widget body = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("Socket"),
          onTap: () {
            // 跳转
            Navigator.of(context).pushNamed("/widget/other/socket/index");
          },
        ),
        Divider(height: 3),
      ],
    );

    // 返回
    return body;
  }
}

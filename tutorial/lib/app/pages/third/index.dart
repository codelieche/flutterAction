// 第三方的库示例首页
import 'package:flutter/material.dart';

class ThirdIndexPage extends StatefulWidget {
  ThirdIndexPage({Key key}) : super(key: key);

  @override
  _ThirdIndexPageState createState() => _ThirdIndexPageState();
}

class _ThirdIndexPageState extends State<ThirdIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed("/third/dio/index");
          },
          leading: Icon(Icons.arrow_right),
          title: Text("网络请求: dio"),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed("/third/flutter_slidable/index");
          },
          leading: Icon(Icons.arrow_right),
          title: Text("滑动功能: flutter_slidable"),
        )
      ],
    );

    // 返回
    return body;
  }
}

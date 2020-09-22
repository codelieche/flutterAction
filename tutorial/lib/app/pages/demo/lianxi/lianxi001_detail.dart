import 'package:flutter/material.dart';

class Lianxi001DetailPage extends StatefulWidget {
  Lianxi001DetailPage({Key key}) : super(key: key);

  @override
  _Lianxi001DetailPageState createState() => _Lianxi001DetailPageState();
}

class _Lianxi001DetailPageState extends State<Lianxi001DetailPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        Text("等待实现"),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

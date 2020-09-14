// 简单的Postman功能
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class DioPostmanDemoPage extends StatefulWidget {
  DioPostmanDemoPage({Key key}) : super(key: key);

  @override
  _DioPostmanDemoPageState createState() => _DioPostmanDemoPageState();
}

class _DioPostmanDemoPageState extends State<DioPostmanDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(
          title: "Postman",
        )
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}

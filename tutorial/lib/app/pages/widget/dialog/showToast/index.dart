// showTaost Index Page
import 'package:flutter/material.dart';

// 引入示例
import 'base.dart';

class ShowToastIndexPage extends StatefulWidget {
  ShowToastIndexPage({Key key}) : super(key: key);

  @override
  _ShowToastIndexPageState createState() => _ShowToastIndexPageState();
}

class _ShowToastIndexPageState extends State<ShowToastIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        ShowToastBaseDemo(),
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}

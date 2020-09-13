// SnackBar
import 'package:flutter/material.dart';

// 引入示例
import 'base.dart';

class SnackBarIndexPage extends StatefulWidget {
  SnackBarIndexPage({Key key}) : super(key: key);

  @override
  _SnackBarIndexPageState createState() => _SnackBarIndexPageState();
}

class _SnackBarIndexPageState extends State<SnackBarIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 页面主体
    Widget body = Column(
      children: [
        SnackBarBaseDemo(),
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}

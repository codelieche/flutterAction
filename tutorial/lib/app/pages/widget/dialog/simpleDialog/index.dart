// SimpleDialog
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

// 引入示例Demo
import 'base.dart';

class SimpleDialogIndexPage extends StatefulWidget {
  SimpleDialogIndexPage({Key key}) : super(key: key);

  @override
  _SimpleDialogIndexPageState createState() => _SimpleDialogIndexPageState();
}

class _SimpleDialogIndexPageState extends State<SimpleDialogIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 基本使用
        SimpleDialogBaseDemo(),
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}

// AlertDialog
import 'package:flutter/material.dart';
// import 'package:tutorial/app/components/items/title.dart';

// 示例
import 'base.dart';
import 'title.dart';
import 'content.dart';
import 'actions.dart';

class AlertDialogIndexPage extends StatefulWidget {
  AlertDialogIndexPage({Key key}) : super(key: key);

  @override
  _AlertDialogIndexPageState createState() => _AlertDialogIndexPageState();
}

class _AlertDialogIndexPageState extends State<AlertDialogIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // ListTile(leading: Icon(Icons.arrow_right), title: Text("基本使用")),
        // 基本使用
        AlertDialogBaseDemo(),
        // 设置title
        AlertDialogTitleDemo(),
        // 设置content
        AlertDialogContentDemo(),
        // 设置actions
        AlertDialogActionsDemo(),
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}

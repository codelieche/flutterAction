// 设置AlertDialog的标题
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class AlertDialogTitleDemo extends StatefulWidget {
  AlertDialogTitleDemo({Key key}) : super(key: key);

  @override
  _AlertDialogTitleDemoState createState() => _AlertDialogTitleDemoState();
}

class _AlertDialogTitleDemoState extends State<AlertDialogTitleDemo> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(title: "设置标题", description: "AlertDialog.title"),
        // 标题可以是文本
        ListTile(
          leading: Icon(Icons.text_fields),
          title: Text("标题使用文本"),
          subtitle: Text('title: Text("对话框标题,可以是文本")'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("对话框标题,可以是文本"),
                  content: Text("内容"),
                );
              },
            );
          },
        ),
        Divider(),

        // 标题可以是图片
        ListTile(
          leading: Icon(Icons.image),
          title: Text("标题使用图片"),
          subtitle: Text('title: Image.asset("uri")'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Image.asset("assets/images/codelieche-blue.png"),
                  content: Text("内容"),
                );
              },
            );
          },
        ),
      ],
    );

    // 返回
    return body;
  }
}

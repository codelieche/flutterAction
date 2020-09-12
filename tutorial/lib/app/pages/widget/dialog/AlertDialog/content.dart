// 设置AlertDialog的Content
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class AlertDialogContentDemo extends StatefulWidget {
  AlertDialogContentDemo({Key key}) : super(key: key);

  @override
  _AlertDialogContentDemoState createState() => _AlertDialogContentDemoState();
}

class _AlertDialogContentDemoState extends State<AlertDialogContentDemo> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(title: "设置内容", description: "AlertDialog.content"),
        // 内容可以是文本
        ListTile(
          leading: Icon(Icons.text_fields),
          title: Text("内容使用文本"),
          subtitle: Text('content: Text("___")'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("对话框"),
                  content: Text(
                    "对话框内容,可以是文本",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.pinkAccent),
                  ),
                );
              },
            );
          },
        ),
        Divider(),

        // 内容可以是图片
        ListTile(
          leading: Icon(Icons.image),
          title: Text("内容使用图片"),
          subtitle: Text('content: Image.asset("uri")'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Image.asset("asserts/images/codelieche-blue.png"),
                  title: Text("对话框"),
                );
              },
            );
          },
        ),

        // 内容可以是checkbox
        ListTile(
          leading: Icon(Icons.image),
          title: Text("内容使选择框"),
          subtitle: Text('content: _CheckBoxContent()'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("对话框"),
                  content: _CheckBoxContent(),
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

// 对话框中使用checkbox
class _CheckBoxContent extends StatefulWidget {
  _CheckBoxContent({Key key}) : super(key: key);

  @override
  _CheckBoxContentState createState() => _CheckBoxContentState();
}

class _CheckBoxContentState extends State<_CheckBoxContent> {
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Column(
        children: [
          CheckboxListTile(
            title: Text("codelieche"),
            value: this.name == "codelieche",
            onChanged: (checked) {
              if (checked) {
                setState(() {
                  name = "codelieche";
                });
              }
            },
          ),
          CheckboxListTile(
            title: Text("编程列车"),
            value: this.name == "编程列车",
            onChanged: (checked) {
              if (checked) {
                setState(() {
                  name = "编程列车";
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

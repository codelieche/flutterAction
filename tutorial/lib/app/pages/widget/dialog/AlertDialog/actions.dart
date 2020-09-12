// 设置AlertDialog的Actions
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class AlertDialogActionsDemo extends StatefulWidget {
  AlertDialogActionsDemo({Key key}) : super(key: key);

  @override
  _AlertDialogActionsDemoState createState() => _AlertDialogActionsDemoState();
}

class _AlertDialogActionsDemoState extends State<AlertDialogActionsDemo> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(title: "设置Action", description: "AlertDialog.action"),
        // 内容可以是IconButton
        ListTile(
          leading: Icon(Icons.text_fields),
          title: Text("使用IconButton"),
          subtitle: Text('action: []'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("对话框"),
                  content: Text("使用IconButton"),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        print("选择close");
                        Navigator.of(context).pop("close");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        print("选择ok");
                        Navigator.of(context).pop("ok");
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
        Divider(),

        // 内容可以是RaisedButton
        ListTile(
          leading: Icon(Icons.text_fields),
          title: Text("使用RaisedButton"),
          subtitle: Text('action: []'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("对话框"),
                  content: Text("使用RaisedButton"),
                  actions: [
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pinkAccent,
                      child: Text("取消"),
                      onPressed: () {
                        print("选择close");
                        Navigator.of(context).pop("close");
                      },
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.lightBlue,
                      child: Text("确认"),
                      onPressed: () {
                        print("选择ok");
                        Navigator.of(context).pop("ok");
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
        Divider(),

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
                  actions: [
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.lightBlue,
                      child: Text("确认"),
                      onPressed: () {
                        print("选择ok");
                        Navigator.of(context).pop("ok");
                      },
                    )
                  ],
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

// AlertDialog的基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class AlertDialogBaseDemo extends StatefulWidget {
  AlertDialogBaseDemo({Key key}) : super(key: key);

  @override
  _AlertDialogBaseDemoState createState() => _AlertDialogBaseDemoState();
}

class _AlertDialogBaseDemoState extends State<AlertDialogBaseDemo> {
  @override
  Widget build(BuildContext context) {
    // AlertDialog基本使用
    Widget body = Column(
      children: [
        // 基本示例
        SimpleTitleWidget(title: "基本使用", description: "showDialog完整示例"),
        Container(
          child:
              // 设置content
              RaisedButton(
            onPressed: () async {
              var result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      // 对话框标题
                      title: Text("标题"),
                      // 弹出的对话框内容
                      content: Text("弹出的消息内容"),
                      // 确认/取消按钮
                      actions: [
                        OutlineButton(
                          onPressed: () {
                            Navigator.of(context).pop("cancel");
                          },
                          child: Text("取消"),
                        ),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.lightBlue,
                          onPressed: () {
                            Navigator.of(context).pop("ok");
                          },
                          child: Text("确认"),
                        ),
                      ],
                    );
                  });
              // 弹出消息后，返回的结果是：
              String msg = "弹出消息后，返回的结果是：$result";
              print(msg);

              // 显示底部消息
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(msg),
                duration: Duration(seconds: 5),
              ));
            },
            child: Text("AlertDialog示例"),
          ),
        ),
        SizedBox(width: 10),
      ],
    );

    // 返回
    return body;
  }
}

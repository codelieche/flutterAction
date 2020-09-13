// showToast基本使用
// 采用了第三方库：fluttertoast

import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToastBaseDemo extends StatefulWidget {
  ShowToastBaseDemo({Key key}) : super(key: key);

  @override
  _ShowToastBaseDemoState createState() => _ShowToastBaseDemoState();
}

class _ShowToastBaseDemoState extends State<ShowToastBaseDemo> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(title: "基本使用", description: "使用第三方库：fluttertoast"),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            RaisedButton(
              onPressed: () {
                // 弹出toast
                Fluttertoast.showToast(
                  msg: "显示简短的信息",
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.lightGreen,
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              },
              child: Text("弹出消息"),
            )
          ],
        ),

        // Toast的时间
        SimpleTitleWidget(
            title: "设置时间", description: "timeInSecForIosWeb: 1|5|10"),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            RaisedButton(
              onPressed: () {
                // 弹出toast
                Fluttertoast.showToast(
                  msg: "1秒消息",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.orangeAccent,
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              },
              child: Text("1秒消息"),
            ),
            RaisedButton(
              onPressed: () {
                // 弹出toast
                Fluttertoast.showToast(
                  msg: "5秒消息",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.orangeAccent,
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              },
              child: Text("5秒消息"),
            ),
            RaisedButton(
              onPressed: () {
                // 弹出toast
                Fluttertoast.showToast(
                  msg: "10秒消息",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 10,
                  backgroundColor: Colors.orangeAccent,
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              },
              child: Text("10秒消息"),
            )
          ],
        ),

        // Toast的位置
        SimpleTitleWidget(
            title: "设置位置", description: "gravity: ToastGravity.BOTTOM(默认)"),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            RaisedButton(
              onPressed: () {
                // 弹出toast
                Fluttertoast.showToast(
                  msg: "居中消息",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.pinkAccent,
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              },
              child: Text("Center"),
            ),
            RaisedButton(
              onPressed: () {
                // 弹出toast
                Fluttertoast.showToast(
                  msg: "顶部消息",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.pinkAccent,
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              },
              child: Text("Top"),
            ),
            RaisedButton(
              onPressed: () {
                // 弹出toast
                Fluttertoast.showToast(
                  msg: "底部消息",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.pinkAccent,
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              },
              child: Text("Bottom"),
            )
          ],
        ),
      ],
    );

    // 返回
    return body;
  }
}

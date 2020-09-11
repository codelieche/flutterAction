// 文本输入框控制器
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutorial/app/components/items/title.dart';

class TextFieldControllerDemoPage extends StatefulWidget {
  TextFieldControllerDemoPage({Key key}) : super(key: key);

  @override
  _TextFieldControllerDemoPageState createState() =>
      _TextFieldControllerDemoPageState();
}

class _TextFieldControllerDemoPageState
    extends State<TextFieldControllerDemoPage> {
  // 控制器
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 基本使用
        SimpleTitleWidget(title: "基本使用", description: "设置TextField.controller"),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            controller: _controller, // 传入控制器
            maxLines: 5,
            maxLength: 256,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),

        // 控制器的操作
        SimpleTitleWidget(title: "操作", description: "使用.controller"),
        Wrap(
          children: [
            // 获取文本内容
            RaisedButton(
              color: Colors.lightBlue,
              textColor: Colors.white,
              onPressed: () {
                String value = _controller.text;
                print(value);
                // 显示会话
                showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text("文本内容"),
                    content: Text(value),
                  ),
                );
              },
              child: Text("获取内容"),
            ),

            SizedBox(width: 10),

            // 设置文本内容
            RaisedButton(
              color: Colors.pinkAccent,
              textColor: Colors.white,
              onPressed: () {
                var now = DateTime.now();
                print(now);
                var format = DateFormat("yyy-MM-dd HH:mm:ss");
                var nowStr = format.format(now);

                String value = "你好，测试! $nowStr";
                _controller.text = value;
              },
              child: Text("设置内容"),
            ),
          ],
        )
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("TextField.controller"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    // 返回
    return scaffold;
  }
}

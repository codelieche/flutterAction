// 文本框设置边框
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class TextFieldBorderDemoPage extends StatefulWidget {
  TextFieldBorderDemoPage({Key key}) : super(key: key);

  @override
  _TextFieldBorderDemoPageState createState() =>
      _TextFieldBorderDemoPageState();
}

class _TextFieldBorderDemoPageState extends State<TextFieldBorderDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主要内容
    Widget body = Column(
      children: [
        // 设置边框，基本使用
        SimpleTitleWidget(
          title: "设置边框",
          description:
              'decoration: InputDecoration(border: OutlineInputBorder())',
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              border: OutlineInputBorder(),
            ),
          ),
        ),

        // 设置边框，基本使用
        SimpleTitleWidget(
          title: "设置填充",
          description:
              'InputDecoration(contentPadding: EdgeInsets.all(5), border: OutlineInputBorder())',
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              prefixIcon: Icon(Icons.account_box),
              labelText: "用户名",
              hintText: "username",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              prefixIcon: Icon(Icons.lock_outline),
              labelText: "密码",
              hintText: "password",
              border: OutlineInputBorder(),
            ),
            obscureText: true, // 隐藏输入内容
          ),
        ),

        // 设置不要边框
        SimpleTitleWidget(
          title: "设置不要边框",
          description:
              'InputDecoration(contentPadding: EdgeInsets.all(5), border: OutlineInputBorder())',
        ),
        Container(
          margin: EdgeInsets.all(5),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.5,
              color: Colors.grey[400],
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: TextField(
            // enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              hintText: "用户名",
              hintStyle: TextStyle(fontSize: 13),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // 设置边框，基本使用
        SimpleTitleWidget(
          title: "边框颜色: 获得焦点",
          description: 'InputDecoration.focusedBorder',
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            // enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              prefixIcon: Icon(Icons.account_box),
              labelText: "用户名",
              hintText: "username",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pinkAccent),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),

        // 设置边框，基本使用
        SimpleTitleWidget(
          title: "边框颜色: 禁用时候",
          description: 'enabled: false; InputDecoration.disabledBorder',
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                prefixIcon: Icon(Icons.account_box),
                labelText: "用户名",
                hintText: "username",
                border: OutlineInputBorder(),
                disabledBorder: OutlineInputBorder(
                  // 禁用的时候的颜色(enabled: false)
                  borderSide: BorderSide(color: Colors.yellow),
                )),
          ),
        ),

        // 设置边框，基本使用
        SimpleTitleWidget(
          title: "边框颜色: 未获得焦点时",
          description: 'InputDecoration.enabledBorder',
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
              // enabled: false,
              decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            prefixIcon: Icon(Icons.account_box),
            labelText: "用户名",
            hintText: "username",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(),
          )),
        ),

        // 设置边框，基本使用
        SimpleTitleWidget(
          title: "边框颜色: 获得焦点和未获取焦点的时候",
          description: 'InputDecoration.focusedBorder/enabledBorder',
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
              // enabled: false,
              decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            prefixIcon: Icon(Icons.account_box),
            labelText: "用户名",
            hintText: "username",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            border: OutlineInputBorder(),
          )),
        ),
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("TextField设置边框"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    // 返回
    return scaffold;
  }
}

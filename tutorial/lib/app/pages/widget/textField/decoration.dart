// 文本输入框装饰
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class TextFieldDecorationDemoPage extends StatefulWidget {
  TextFieldDecorationDemoPage({Key key}) : super(key: key);

  @override
  _TextFieldDecorationDemoPageState createState() =>
      _TextFieldDecorationDemoPageState();
}

class _TextFieldDecorationDemoPageState
    extends State<TextFieldDecorationDemoPage> {
  var _obscureTextValue = false;

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 基本装饰:
        SimpleTitleWidget(
            title: "decoration", description: "decoration: InputDecoration()"),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(),
          ),
        ),

        // Label:类似html的label
        SimpleTitleWidget(
            title: "标签:Label",
            description: 'InputDecoration(labelText: "用户名")'),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(labelText: "用户名"),
          ),
        ),

        // Label样式
        SimpleTitleWidget(
            title: "标签:Label",
            description: 'InputDecoration(labelText: "用户名")'),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.pinkAccent),
                labelText: "用户名"),
          ),
        ),

        // 提示文本:类似html的placeholder
        SimpleTitleWidget(
            title: "提示文字",
            description:
                '类似html的placeholder。InputDecoration(hintText: "提示文本")'),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(hintText: "提示文本"),
          ),
        ),

        // 前缀
        SimpleTitleWidget(
            title: "输入框前缀：prefix", description: 'prefixIcon/prefix'),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_box), hintText: "用户名"),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.local_mall),
              hintText: "密码",
            ),
            obscureText: true, // 隐藏输入的密码
          ),
        ),

        // 前缀
        SimpleTitleWidget(title: "前缀文本", description: 'prefixText'),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                prefixText: "G-",
                prefixIcon: Icon(Icons.code),
                hintText: "验证码"),
          ),
        ),

        // 后缀组件
        SimpleTitleWidget(title: "设置后缀组件", description: 'prefixText'),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.only(top: 12, left: 5),
                  child: Text("密码:"),
                ),
                hintText: "password",
                suffixIcon: IconButton(
                    icon: Icon(Icons.lock_outline),
                    onPressed: () {
                      setState(() {
                        _obscureTextValue = !_obscureTextValue;
                      });
                    })),
            obscureText: _obscureTextValue,
          ),
        ),

        // 边框颜色
        SimpleTitleWidget(
            title: "设置边框", description: 'border: OutlineInputBorder()'),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              prefixIcon: Icon(Icons.account_box),
              hintText: "用户名",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "描述",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("TextField.decoration"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    return scaffold;
  }
}

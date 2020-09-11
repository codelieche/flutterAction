// 文本输入框的键盘类型
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class TextFieldKeyBoardTypeDemoPage extends StatefulWidget {
  TextFieldKeyBoardTypeDemoPage({Key key}) : super(key: key);

  @override
  _TextFieldKeyBoardTypeDemoPageState createState() =>
      _TextFieldKeyBoardTypeDemoPageState();
}

class _TextFieldKeyBoardTypeDemoPageState
    extends State<TextFieldKeyBoardTypeDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 键盘类型，默认
        SimpleTitleWidget(
          title: "默认",
          description: 'keyboardType: TextInputType.text(默认)',
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_box),
              hintText: "用户名",
            ),
            keyboardType: TextInputType.text,
          ),
        ),

        // 键盘类型:邮箱
        SimpleTitleWidget(
          title: "邮箱:emailAddress",
          description: 'keyboardType: TextInputType.emailAddress',
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: "邮箱",
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),

        // 键盘类型:手机号
        SimpleTitleWidget(
          title: "手机号:phone",
          description: 'keyboardType: TextInputType.phone',
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone_iphone),
              hintText: "手机号",
            ),
            keyboardType: TextInputType.phone,
          ),
        ),

        // 键盘类型:数字
        SimpleTitleWidget(
          title: "数字:number",
          description: 'keyboardType: TextInputType.number',
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_view_day),
              hintText: "次数",
            ),
            keyboardType: TextInputType.number,
          ),
        ),

        // 键盘类型:日期时间
        SimpleTitleWidget(
          title: "日期时间:datetime",
          description: 'keyboardType: TextInputType.datetime',
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.date_range),
              hintText: "日期",
            ),
            keyboardType: TextInputType.datetime,
          ),
        ),

        // 键盘类型:url
        SimpleTitleWidget(
          title: "连接:url",
          description: 'keyboardType: TextInputType.url',
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.insert_link),
              hintText: "链接",
            ),
            keyboardType: TextInputType.url,
          ),
        ),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
        appBar: AppBar(
          title: Text("TextField.keyboardType"),
        ),
        body: SingleChildScrollView(
          child: body,
        ));
    return scaffold;
  }
}

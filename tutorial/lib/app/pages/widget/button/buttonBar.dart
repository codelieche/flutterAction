// 按钮组
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ButtonBarDemoPage extends StatefulWidget {
  ButtonBarDemoPage({Key key}) : super(key: key);

  @override
  _ButtonBarDemoPageState createState() => _ButtonBarDemoPageState();
}

class _ButtonBarDemoPageState extends State<ButtonBarDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 基本使用
        SimpleTitleWidget(title: "基本使用"),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            ButtonBar(
              children: [
                RaisedButton(onPressed: () {}, child: Text("登录")),
                // RaisedButton(onPressed: () {}, child: Text("验证码登录")),
                RaisedButton(onPressed: () {}, child: Text("注册")),
                RaisedButton(onPressed: () {}, child: Text("忘记密码")),
                RaisedButton(onPressed: () {}, child: Text("修改密码")),
              ],
            )
          ],
        )
      ],
    );
    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}

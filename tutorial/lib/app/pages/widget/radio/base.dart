// 表单：单选按钮的基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class RadioBaseDemoPage extends StatefulWidget {
  RadioBaseDemoPage({Key key}) : super(key: key);

  @override
  _RadioBaseDemoPageState createState() => _RadioBaseDemoPageState();
}

class _RadioBaseDemoPageState extends State<RadioBaseDemoPage> {
  // 名字
  String name;
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 基本使用
        SimpleTitleWidget(title: "基本使用"),
        Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text("codelieche"),
            ),
            Radio(
              // activeColor: Colors.pinkAccent,
              value: "codelieche",
              groupValue: this.name,
              onChanged: (value) {
                print("值变更了：$value");
                setState(() {
                  name = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text("编程列车"),
            ),
            Radio(
              value: "编程列车",
              groupValue: this.name,
              onChanged: (value) {
                print("值变更了：$value");
                setState(() {
                  name = value;
                });
              },
            ),
          ],
        ),

        // 设置激活颜色
        SimpleTitleWidget(
            title: "选中颜色", description: "activeColor: Colors.pinkAccent"),
        Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text("codelieche"),
            ),
            Radio(
              activeColor: Colors.pinkAccent,
              value: "codelieche",
              groupValue: this.name,
              onChanged: (value) {
                print("值变更了：$value");
                setState(() {
                  name = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text("编程列车"),
            ),
            Radio(
              value: "编程列车",
              activeColor: Colors.pinkAccent,
              groupValue: this.name,
              onChanged: (value) {
                print("值变更了：$value");
                setState(() {
                  name = value;
                });
              },
            ),
          ],
        )
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("raido基本使用"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    // 返回
    return scaffold;
  }
}

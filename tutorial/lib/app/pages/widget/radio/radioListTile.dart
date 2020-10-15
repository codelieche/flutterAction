// 表单：RadioListTile的基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class RadioListTileBaseDemoPage extends StatefulWidget {
  RadioListTileBaseDemoPage({Key key}) : super(key: key);

  @override
  _RadioListTileBaseDemoPageState createState() =>
      _RadioListTileBaseDemoPageState();
}

class _RadioListTileBaseDemoPageState extends State<RadioListTileBaseDemoPage> {
  // 名字
  String name;
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 基本使用
        SimpleTitleWidget(title: "基本使用", description: "比Radio多了个title属性"),
        Wrap(
          children: [
            RadioListTile(
              dense: true,
              value: "codelieche",
              groupValue: this.name,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              title: Text("codelieche"),
            ),
            RadioListTile(
              dense: true,
              value: "编程列车",
              groupValue: this.name,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              title: Text("编程列车"),
            ),
          ],
        ),

        // 子标题
        SimpleTitleWidget(title: "子标题", description: "设置subtitle"),
        Wrap(
          children: [
            RadioListTile(
              activeColor: Colors.pinkAccent,
              dense: true,
              value: "codelieche",
              groupValue: this.name,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              title: Text("codelieche"),
              subtitle: Text("codelieche.com"),
            ),
            RadioListTile(
              dense: true,
              value: "编程列车",
              activeColor: Colors.pinkAccent,
              groupValue: this.name,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              title: Text("编程列车"),
              subtitle: Text("www.codelieche.com"),
              secondary: Image.asset("asserts/images/codelieche-logo-blue.png"),
            ),
          ],
        ),

        // 设置选中selected
        SimpleTitleWidget(title: "设置选中", description: "selected: true/false"),
        Wrap(
          children: [
            RadioListTile(
              activeColor: Colors.pinkAccent,
              dense: true,
              value: "codelieche",
              groupValue: this.name,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              title: Text("codelieche"),
              subtitle: Text("codelieche.com"),
              // 选中的时候，文本颜色是否跟随改变
              selected: this.name == "codelieche",
            ),
            RadioListTile(
              value: "编程列车",
              dense: true,
              activeColor: Colors.pinkAccent,
              groupValue: this.name,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              title: Text("编程列车"),
              subtitle: Text("www.codelieche.com"),
              // 设置图标或者图片
              secondary: Image.asset("asserts/images/codelieche-logo-blue.png"),
              // 选中的时候，文本颜色是否跟随改变
              selected: this.name == "编程列车",
            ),
          ],
        ),
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("RadioListTile"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    // 返回
    return scaffold;
  }
}

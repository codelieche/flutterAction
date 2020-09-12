// CheckBox的基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class CheckBoxBaseDemoPage extends StatefulWidget {
  CheckBoxBaseDemoPage({Key key}) : super(key: key);

  @override
  _CheckBoxBaseDemoPageState createState() => _CheckBoxBaseDemoPageState();
}

class _CheckBoxBaseDemoPageState extends State<CheckBoxBaseDemoPage> {
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
              padding: EdgeInsets.only(top: 14),
              child: Text("codelieche"),
            ),
            Checkbox(
              value: this.name == "codelieche",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 14),
              child: Text("编程列车"),
            ),
            Checkbox(
              value: this.name == "编程列车",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
            )
          ],
        ),

        // 选择的颜色
        SimpleTitleWidget(title: "选择时颜色"),
        Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 14),
              child: Text("codelieche"),
            ),
            Checkbox(
              activeColor: Colors.pinkAccent,
              value: this.name == "codelieche",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 14),
              child: Text("编程列车"),
            ),
            Checkbox(
              activeColor: Colors.pinkAccent,
              value: this.name == "编程列车",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
            )
          ],
        ),

        // CheckBoxListTile
        SimpleTitleWidget(
          title: "CheckboxListTile",
          description: "比Checkbox多几个参数：title, subtitle, secondary",
        ),
        Wrap(
          children: [
            CheckboxListTile(
              value: this.name == "codelieche",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "codelieche";
                  });
                }
              },
              title: Text("codelieche"),
            ),
            CheckboxListTile(
              value: this.name == "编程列车",
              onChanged: (checked) {
                if (checked) {
                  setState(() {
                    name = "编程列车";
                  });
                }
              },
              title: Text("编程列车"),
            )
          ],
        )
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    // 返回
    return scaffold;
  }
}

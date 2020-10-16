// CheckBox Index Demo Page
import 'package:flutter/material.dart';

// CheckBox 示例
import 'base.dart';
import 'checkboxListTile.dart';

class CheckBoxIndexDemoPage extends StatefulWidget {
  CheckBoxIndexDemoPage({Key key}) : super(key: key);

  @override
  _CheckBoxIndexDemoPageState createState() => _CheckBoxIndexDemoPageState();
}

class _CheckBoxIndexDemoPageState extends State<CheckBoxIndexDemoPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: [
          // 示例1：
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return CheckBoxBaseDemoPage();
              }));
            },
            title: Text("基本使用"),
          ),
          Divider(height: 5),

          // 示例2：
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return CheckBoxListTileBaseDemoPage();
              }));
            },
            title: Text("CheckboxListTile"),
          ),
          Divider(height: 5),
        ],
      ),
    );

    body = SingleChildScrollView(
      child: body,
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

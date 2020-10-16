// Radio 示例
import 'package:flutter/material.dart';

// Radio 示例
import 'base.dart';
import 'radioListTile.dart';

class RadioIndexDemoPage extends StatefulWidget {
  RadioIndexDemoPage({Key key}) : super(key: key);

  @override
  _RadioIndexDemoPageState createState() => _RadioIndexDemoPageState();
}

class _RadioIndexDemoPageState extends State<RadioIndexDemoPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: [
          // 示例1：raido的基本使用
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              // 跳转:
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return RadioBaseDemoPage();
              }));
            },
            title: Text("基本使用"),
          ),

          Divider(height: 5),

          // 示例2：RaidoListTile的基本使用
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              // 跳转:
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return RadioListTileBaseDemoPage();
              }));
            },
            title: Text("RaidoListTile"),
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
        title: Text("Radio"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

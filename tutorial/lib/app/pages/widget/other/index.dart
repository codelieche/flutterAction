// 其它组件
import 'package:flutter/material.dart';

import 'aspectRatio.dart';

class OtherWidgetIndexPage extends StatefulWidget {
  OtherWidgetIndexPage({Key key}) : super(key: key);

  @override
  _OtherWidgetIndexPageState createState() => _OtherWidgetIndexPageState();
}

class _OtherWidgetIndexPageState extends State<OtherWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    ListView body = ListView(
      children: [
        // 屏幕宽高比
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("AspectRatio: 屏幕宽高比"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return AspectRatioDemoPage();
            }));
          },
        ),
        Divider(),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("其它Widget"),
      ),
      body: body,
    );

    return scaffold;
  }
}

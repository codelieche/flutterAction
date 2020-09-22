// 其它组件
import 'package:flutter/material.dart';

import 'aspectRatio.dart';
import 'progressIndicator.dart';

class LayoutOtherWidgetIndexPage extends StatefulWidget {
  LayoutOtherWidgetIndexPage({Key key}) : super(key: key);

  @override
  _LayoutOtherWidgetIndexPageState createState() =>
      _LayoutOtherWidgetIndexPageState();
}

class _LayoutOtherWidgetIndexPageState
    extends State<LayoutOtherWidgetIndexPage> {
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

        // 进度条
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("ProgressIndication: 进度条"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return ProgressIndicatorDemoPage();
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

// 其它组件
import 'package:flutter/material.dart';

import 'progressIndicator.dart';

class SimpleOtherWidgetIndexPage extends StatefulWidget {
  SimpleOtherWidgetIndexPage({Key key}) : super(key: key);

  @override
  _SimpleOtherWidgetIndexPageState createState() =>
      _SimpleOtherWidgetIndexPageState();
}

class _SimpleOtherWidgetIndexPageState
    extends State<SimpleOtherWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    ListView body = ListView(
      children: [
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

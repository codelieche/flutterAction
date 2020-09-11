// OutLineButton

import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class OutLineButtonDemoPage extends StatefulWidget {
  OutLineButtonDemoPage({Key key}) : super(key: key);

  @override
  _OutLineButtonDemoPageState createState() => _OutLineButtonDemoPageState();
}

class _OutLineButtonDemoPageState extends State<OutLineButtonDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 默认示例
        SimpleTitleWidget(title: "基本使用", description: "OutlineButton"),
        Wrap(
          children: [
            OutlineButton(
              onPressed: () {},
              child: Text("线框按钮"),
            ),
            OutlineButton(
              onPressed: () {},
              child: Text("默认"),
            ),
            OutlineButton(
              onPressed: () {},
              child: Text("设置textColor"),
              textColor: Colors.lightBlue,
            ),
            OutlineButton(
              onPressed: () {},
              child: Text("设置splashColor"),
              splashColor: Colors.lightBlue,
            ),
            OutlineButton(
              onPressed: () {},
              child: Text("设置borderSide"),
              splashColor: Colors.yellow,
              borderSide: BorderSide(
                color: Colors.pinkAccent,
              ),
            ),
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

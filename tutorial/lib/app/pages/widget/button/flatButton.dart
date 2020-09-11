// FlatButton
// 用法其实和其它几个按钮是差不多的

import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class FlatButtonDemoPage extends StatefulWidget {
  FlatButtonDemoPage({Key key}) : super(key: key);

  @override
  _FlatButtonDemoPageState createState() => _FlatButtonDemoPageState();
}

class _FlatButtonDemoPageState extends State<FlatButtonDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容：body
    Widget body = Column(
      children: [
        // 设置文本颜色
        SimpleTitleWidget(title: "设置颜色", description: "textColor/color"),
        Wrap(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text("红色字体"),
              color: Colors.grey,
              textColor: Colors.red,
            ),
            FlatButton(
              onPressed: () {},
              child: Text("默认"),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("红色背景"),
              color: Colors.red,
              textColor: Colors.white,
            )
          ],
        ),

        // 设置宽和高
        SimpleTitleWidget(title: "设置宽和高", description: "包裹一层container"),
        Wrap(
          children: [
            Container(
              width: 100,
              height: 50,
              margin: EdgeInsets.all(5),
              child: FlatButton(
                onPressed: () {},
                child: Text("100 x 50"),
                color: Colors.grey,
                textColor: Colors.red,
              ),
            ),
            Container(
              width: 60,
              height: 80,
              margin: EdgeInsets.all(5),
              color: Colors.lightBlue,
              child: FlatButton(
                onPressed: () {},
                child: Text("默认"),
              ),
            ),
            Container(
              width: 90,
              height: 70,
              margin: EdgeInsets.all(5),
              child: FlatButton(
                onPressed: () {},
                child: Text("红色背景"),
                color: Colors.red,
                textColor: Colors.white,
              ),
            )
          ],
        ),

        // 圆角按钮
        SimpleTitleWidget(title: "圆角按钮", description: "设置shape"),
        Wrap(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text("红色字体"),
              color: Colors.yellow,
              textColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("默认"),
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.lightBlue,
                ),
              ),
            ),
            Container(
              height: 80,
              child: FlatButton(
                onPressed: () {},
                child: Text("红色背景"),
                color: Colors.red,
                textColor: Colors.white,
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
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

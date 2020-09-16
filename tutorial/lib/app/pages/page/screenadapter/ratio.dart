// 屏幕适配:
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ScreenAdapterRatioPage extends StatefulWidget {
  ScreenAdapterRatioPage({Key key}) : super(key: key);

  @override
  _ScreenAdapterRatioPageState createState() => _ScreenAdapterRatioPageState();
}

class _ScreenAdapterRatioPageState extends State<ScreenAdapterRatioPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        // 1:2:3
        SimpleTitleWidget(
          title: "使用Expanded",
          description: "Expanded(flex:1)",
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("1"),
                color: Colors.pinkAccent,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("1"),
                color: Colors.lightBlue[200],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("1"),
                color: Colors.grey[400],
              ),
            ),
          ],
        ),

        // 1:2:3
        SimpleTitleWidget(
          title: "使用Expanded",
          description: "Expanded: 设置(1:2:3)",
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("1"),
                color: Colors.pinkAccent,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("2"),
                color: Colors.lightBlue[200],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("3"),
                color: Colors.grey[400],
              ),
            ),
          ],
        ),

        // 设置高度
        SimpleTitleWidget(
            title: "设置宽高比", description: "AspectRatio.aspectRatio"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Text("1/1"),
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1 / 2,
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Text("1/2"),
                  color: Colors.lightBlue[200],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1 / 3,
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Text("1/3"),
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("使用比率"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

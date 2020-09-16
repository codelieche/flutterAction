// 屏幕适配
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:tutorial/app/utils/screen/adapter.dart';

class ScreenAdapterScreenUtilPage extends StatefulWidget {
  ScreenAdapterScreenUtilPage({Key key}) : super(key: key);

  @override
  _ScreenAdapterScreenUtilPageState createState() =>
      _ScreenAdapterScreenUtilPageState();
}

class _ScreenAdapterScreenUtilPageState
    extends State<ScreenAdapterScreenUtilPage> {
  @override
  Widget build(BuildContext context) {
    // 必须初始化一下
    ScreenAdapter.init(context);

    // 主体内容
    Widget body = ListView(
      children: [
        SimpleTitleWidget(
            title: "设置宽", description: "ScreenAdapter.setWidth(100)"),
        Row(
          children: [
            Container(
              width: ScreenAdapter.setWidth(375 / 2),
              height: 100,
              alignment: Alignment.center,
              child: Text("width: ScreenAdapter.setWidth(100)"),
              color: Colors.pinkAccent,
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 375.0 / 2,
              height: 100,
              alignment: Alignment.center,
              child: Text("直接使用width: 187.5"),
              color: Colors.lightBlue,
            )
          ],
        ),

        // 设置高度
        SimpleTitleWidget(
            title: "设置高度", description: "ScreenAdapter.setHeight(80)"),
        Row(
          children: [
            Expanded(
              child: Container(
                height: ScreenAdapter.setHeight(80),
                color: Colors.pinkAccent,
                alignment: Alignment.center,
                child: Text(
                  "height:ScreenAdapter.setHeight(80)",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 80,
                color: Colors.lightBlue,
                alignment: Alignment.center,
                child: Text(
                  "height:80",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("ScreenUtil设置宽高"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

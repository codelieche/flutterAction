// Switch Base Demo Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:tutorial/app/variables.dart';

class SwitchBaseDemoPage extends StatefulWidget {
  SwitchBaseDemoPage({Key key}) : super(key: key);

  @override
  _SwitchBaseDemoPageState createState() => _SwitchBaseDemoPageState();
}

class _SwitchBaseDemoPageState extends State<SwitchBaseDemoPage> {
  bool checked = false; // 是否选中

  Container buildScaleSwitchContainer(double scale) {
    return Container(
      child: Transform.scale(
        scale: scale,
        child: buildCupertinoSwitch(),
      ),
    );
  }

  CupertinoSwitch buildCupertinoSwitch() {
    return CupertinoSwitch(
      activeColor: AppPrimaryColor,
      value: checked,
      onChanged: (value) {
        print("是否选中$value");
        setState(() {
          checked = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 页面内容
    Widget body = ListView(
      children: [
        SimpleTitleWidget(
          title: "基本使用",
          description: "Switch和CupertinoSwitch",
        ),
        // 示例一：
        Row(
          children: [
            Container(
              child: Switch(
                value: checked,
                onChanged: (value) {
                  print("是否选中$value");
                  setState(() {
                    checked = value;
                  });
                },
              ),
            ),
            Container(
              child: CupertinoSwitch(
                activeColor: AppPrimaryColor,
                value: checked,
                onChanged: (value) {
                  print("是否选中$value");
                  setState(() {
                    checked = value;
                  });
                },
              ),
            ),
            buildScaleSwitchContainer(0.8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    checked ? "选中" : "未选中",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  buildScaleSwitchContainer(0.7),
                ],
              ),
            )
          ],
        )
      ],
    );

    // 返回
    return body;
  }
}

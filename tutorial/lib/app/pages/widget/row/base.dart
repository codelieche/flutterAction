import 'package:flutter/material.dart';

import 'package:tutorial/app/components/items/title.dart';
import 'items.dart';

class RowBaseDemoPage extends StatefulWidget {
  RowBaseDemoPage({Key key}) : super(key: key);

  @override
  _RowBaseDemoPageState createState() => _RowBaseDemoPageState();
}

class _RowBaseDemoPageState extends State<RowBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        // 默认3个放一行：
        SimpleTitleWidget(title: "不灵活布局:"),
        Row(
          children: threeSquareContainer,
        ),

        // 填满一行
        SimpleTitleWidget(title: "填满整行:Expanded"),
        Row(
          children: threeSquareContainer.map((e) {
            return Expanded(child: e);
          }).toList(),
        ),

        // 主轴横向对齐方式: center
        SimpleTitleWidget(title: "MainAxisAlignment.center"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: threeSquareContainer,
        ),
      ],
    ));
  }
}

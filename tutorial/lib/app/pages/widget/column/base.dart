import 'package:flutter/material.dart';

import 'package:tutorial/app/components/items/title.dart';
import 'items.dart';

class ColumnBaseDemoPage extends StatefulWidget {
  ColumnBaseDemoPage({Key key}) : super(key: key);

  @override
  _ColumnBaseDemoPageState createState() => _ColumnBaseDemoPageState();
}

class _ColumnBaseDemoPageState extends State<ColumnBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        // 默认3个放一行：
        SimpleTitleWidget(title: "不灵活布局:"),
        Container(
          width: 200,
          height: 200,
          color: Colors.green[200],
          child: Column(
            children: threeSquareContainer,
          ),
        ),

        // 填满一行
        SimpleTitleWidget(title: "填满父容器的高:Expanded"),
        Container(
          width: 200,
          height: 200,
          color: Colors.green[200],
          child: Column(
              children: threeSquareContainer.map((e) {
            return Expanded(child: e);
          }).toList()),
        ),

        // 主轴横向对齐方式: center
        SimpleTitleWidget(title: "MainAxisAlignment.center"),
        Container(
          color: Colors.green[200],
          height: 200,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: threeSquareContainer,
          ),
        ),
      ],
    ));
  }
}

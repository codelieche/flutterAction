import 'package:flutter/material.dart';

import 'package:tutorial/app/components/items/title.dart';
import 'items.dart';

class RowMainAxisDemoPage extends StatefulWidget {
  RowMainAxisDemoPage({Key key}) : super(key: key);

  @override
  _RowMainAxisDemoPageState createState() => _RowMainAxisDemoPageState();
}

class _RowMainAxisDemoPageState extends State<RowMainAxisDemoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        // 主轴横向对齐方式: start
        SimpleTitleWidget(title: "MainAxisAlignment.start(默认)"),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: threeSquareContainer,
        ),

        // 主轴横向对齐方式: center
        SimpleTitleWidget(title: "MainAxisAlignment.center"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: threeSquareContainer,
        ),

        // 主轴横向对齐方式: end
        SimpleTitleWidget(title: "MainAxisAlignment.end"),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: threeSquareContainer,
        ),

        // 主轴横向对齐方式: spaceAround
        SimpleTitleWidget(title: "MainAxisAlignment.spaceAround"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: threeSquareContainer,
        ),

        // 主轴横向对齐方式: spaceEvenly
        SimpleTitleWidget(title: "MainAxisAlignment.spaceEvenly"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: threeSquareContainer,
        ),

        // 主轴横向对齐方式: spaceBetween
        SimpleTitleWidget(title: "MainAxisAlignment.spaceBetween"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: threeSquareContainer,
        ),
      ],
    ));
  }
}

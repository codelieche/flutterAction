import 'package:flutter/material.dart';

import 'package:tutorial/app/components/items/title.dart';
import 'items.dart';

class ColumnMainAxisDemoPage extends StatefulWidget {
  ColumnMainAxisDemoPage({Key key}) : super(key: key);

  @override
  _ColumnMainAxisDemoPageState createState() => _ColumnMainAxisDemoPageState();
}

class _ColumnMainAxisDemoPageState extends State<ColumnMainAxisDemoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        // 主轴横向对齐方式: start
        SimpleTitleWidget(title: "MainAxisAlignment.start(默认)"),
        Container(
            width: 200,
            height: 200,
            color: Colors.green[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: threeSquareContainer,
            )),

        // 主轴横向对齐方式: center
        SimpleTitleWidget(title: "MainAxisAlignment.center"),
        Container(
            width: 200,
            height: 200,
            color: Colors.green[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: threeSquareContainer,
            )),

        // 主轴横向对齐方式: end
        SimpleTitleWidget(title: "MainAxisAlignment.end"),
        Container(
            width: 200,
            height: 200,
            color: Colors.green[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: threeSquareContainer,
            )),

        // 主轴横向对齐方式: spaceAround
        SimpleTitleWidget(title: "MainAxisAlignment.spaceAround"),
        Container(
            width: 200,
            height: 200,
            color: Colors.green[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: threeSquareContainer,
            )),

        // 主轴横向对齐方式: spaceEvenly
        SimpleTitleWidget(title: "MainAxisAlignment.spaceEvenly"),
        Container(
            width: 200,
            height: 200,
            color: Colors.green[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: threeSquareContainer,
            )),

        // 主轴横向对齐方式: spaceBetween
        SimpleTitleWidget(title: "MainAxisAlignment.spaceBetween"),
        Container(
            width: 200,
            height: 200,
            color: Colors.green[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: threeSquareContainer,
            )),
      ],
    ));
  }
}

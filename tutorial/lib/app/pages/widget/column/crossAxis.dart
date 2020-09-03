import 'package:flutter/material.dart';

import 'package:tutorial/app/components/items/title.dart';
import 'items.dart';

class ColumnCrossAxisDemoPage extends StatefulWidget {
  ColumnCrossAxisDemoPage({Key key}) : super(key: key);

  @override
  _ColumnCrossAxisDemoPageState createState() =>
      _ColumnCrossAxisDemoPageState();
}

class _ColumnCrossAxisDemoPageState extends State<ColumnCrossAxisDemoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        // 默认4个放一行：
        // 辅轴(横向)对其方式：center
        SimpleTitleWidget(title: "CrossAxisAlignment.center(默认)"),

        Container(
          width: 300,
          color: Colors.green[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: fourContainer,
          ),
        ),

        // 辅轴(横向)对其方式：start
        SimpleTitleWidget(title: "CrossAxisAlignment.start"),
        Container(
          width: 300,
          color: Colors.green[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fourContainer,
          ),
        ),

        // 辅轴(横向)对其方式：end
        SimpleTitleWidget(title: "CrossAxisAlignment.end"),
        Container(
          width: 300,
          color: Colors.green[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: fourContainer,
          ),
        )
      ],
    ));
  }
}

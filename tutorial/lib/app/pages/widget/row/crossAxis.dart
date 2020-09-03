import 'package:flutter/material.dart';

import 'package:tutorial/app/components/items/title.dart';
import 'items.dart';

class RowCrossAxisDemoPage extends StatefulWidget {
  RowCrossAxisDemoPage({Key key}) : super(key: key);

  @override
  _RowCrossAxisDemoPageState createState() => _RowCrossAxisDemoPageState();
}

class _RowCrossAxisDemoPageState extends State<RowCrossAxisDemoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        // 默认4个放一行：
        SimpleTitleWidget(title: "CrossAxisAlignment.center(默认)"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: fourContainer,
        ),

        // 纵轴对齐方式: start
        SimpleTitleWidget(title: "CrossAxisAlignment.start"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fourContainer,
        ),

        // 纵轴对齐方式: end
        SimpleTitleWidget(title: "CrossAxisAlignment.end"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: fourContainer,
        ),
      ],
    ));
  }
}

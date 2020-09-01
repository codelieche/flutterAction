/**
 * Column相关的组件示例
 * 路由：/widget/column/index
 */
import 'package:flutter/material.dart';

class ColumnWidgetIndexPage extends StatefulWidget {
  @override
  _ColumnWidgetIndexPageState createState() => _ColumnWidgetIndexPageState();
}

class _ColumnWidgetIndexPageState extends State<ColumnWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Column"),
      ),
    );

    return scaffold;
  }
}

/**
 * Row相关的组件示例
 * 路由：/widget/row/index
 */
import 'package:flutter/material.dart';

class RowWidgetIndexPage extends StatefulWidget {
  @override
  _RowWidgetIndexPageState createState() => _RowWidgetIndexPageState();
}

class _RowWidgetIndexPageState extends State<RowWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Row"),
      ),
    );

    return scaffold;
  }
}

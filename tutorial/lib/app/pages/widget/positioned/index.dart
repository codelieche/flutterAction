/**
 * Positioned相关的组件示例
 * 路由：/widget/positioned/index
 */
import 'package:flutter/material.dart';

class PositionedWidgetIndexPage extends StatefulWidget {
  @override
  _PositionedWidgetIndexPageState createState() => _PositionedWidgetIndexPageState();
}

class _PositionedWidgetIndexPageState extends State<PositionedWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Positioned"),
      ),
    );

    return scaffold;
  }
}

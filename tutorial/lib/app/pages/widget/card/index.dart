/**
 * Card相关的组件示例
 * 路由：/widget/card/index
 */
import 'package:flutter/material.dart';

class CardWidgetIndexPage extends StatefulWidget {
  @override
  _CardWidgetIndexPageState createState() => _CardWidgetIndexPageState();
}

class _CardWidgetIndexPageState extends State<CardWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
    );

    return scaffold;
  }
}

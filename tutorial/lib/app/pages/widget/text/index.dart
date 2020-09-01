import 'package:flutter/material.dart';

// Text基本使用
import 'base.dart';
// textAlign
import 'textAlign.dart';
// overflow
import 'overflow.dart';

class TextWidgetIndexPage extends StatefulWidget {
  @override
  _TextWidgetIndexPageState createState() => _TextWidgetIndexPageState();
}

class _TextWidgetIndexPageState extends State<TextWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = ListView(
      children: [
        // Text 基本使用
        TextBaseDemo(),
        // textAlign
        TextAlignDemo(),
        // overflow
        TextOverFlowDemo(),
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: body,
    );

    return scaffold;
  }
}

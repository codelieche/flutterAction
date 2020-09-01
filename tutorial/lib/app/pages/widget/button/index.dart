/**
 * 按钮相关的组件
 * 路由：/widget/button/index
 */
import 'package:flutter/material.dart';

class ButtonWidgetIndexPage extends StatefulWidget {
  @override
  _ButtonWidgetIndexPageState createState() => _ButtonWidgetIndexPageState();
}

class _ButtonWidgetIndexPageState extends State<ButtonWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Button"),
      ),
    );

    return scaffold;
  }
}

/**
 * Stack相关的组件示例
 * 路由：/widget/stack/index
 */
import 'package:flutter/material.dart';

class StackWidgetIndexPage extends StatefulWidget {
  @override
  _StackWidgetIndexPageState createState() => _StackWidgetIndexPageState();
}

class _StackWidgetIndexPageState extends State<StackWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
    );

    return scaffold;
  }
}

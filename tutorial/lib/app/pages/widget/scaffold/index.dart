/**
 * Scaffold相关的组件示例
 * 路由：/widget/scaffold/index
 */
import 'package:flutter/material.dart';

class ScaffoldWidgetIndexPage extends StatefulWidget {
  @override
  _ScaffoldWidgetIndexPageState createState() => _ScaffoldWidgetIndexPageState();
}

class _ScaffoldWidgetIndexPageState extends State<ScaffoldWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
      ),
    );

    return scaffold;
  }
}

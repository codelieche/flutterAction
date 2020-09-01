/**
 * Wrap相关的组件示例
 * 路由：/widget/wrap/index
 */
import 'package:flutter/material.dart';

class WrapWidgetIndexPage extends StatefulWidget {
  @override
  _WrapWidgetIndexPageState createState() => _WrapWidgetIndexPageState();
}

class _WrapWidgetIndexPageState extends State<WrapWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
      ),
    );

    return scaffold;
  }
}

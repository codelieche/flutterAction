/**
 * 容器相关的组件示例
 * 路由：/widget/container/index
 */
import 'package:flutter/material.dart';

class ContainerWidgetIndexPage extends StatefulWidget {
  @override
  _ContainerWidgetIndexPageState createState() => _ContainerWidgetIndexPageState();
}

class _ContainerWidgetIndexPageState extends State<ContainerWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
    );

    return scaffold;
  }
}

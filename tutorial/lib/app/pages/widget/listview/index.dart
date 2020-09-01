/**
 * ListView相关的示例
 * 路由：/widget/listview/index
 */
import 'package:flutter/material.dart';


class ListViewWidgetIndexPage extends StatefulWidget {
  @override
  _ListViewWidgetIndexPageState createState() => _ListViewWidgetIndexPageState();
}

class _ListViewWidgetIndexPageState extends State<ListViewWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Center(
        child: Text("Hello List View"),
      ),
    );

    // 返回
    return scaffold;
  }
}

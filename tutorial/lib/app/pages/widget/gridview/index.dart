/**
 * ListView相关的示例
 * 路由：/widget/listview/index
 */
import 'package:flutter/material.dart';


class GridViewWidgetIndexPage extends StatefulWidget {
  @override
  _GridViewWidgetIndexPageState createState() => _GridViewWidgetIndexPageState();
}

class _GridViewWidgetIndexPageState extends State<GridViewWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
    );

    // 返回
    return scaffold;
  }
}

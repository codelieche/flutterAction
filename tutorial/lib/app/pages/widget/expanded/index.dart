// Expanded
// Expanded是用于展开Row、Column或Flex的子child的Widget。
// 重点参数：flex默认是1
import 'package:flutter/material.dart';
import 'row.dart';
import 'column.dart';
import 'flex.dart';

class ExpandedWidgetIndexPage extends StatefulWidget {
  ExpandedWidgetIndexPage({Key key}) : super(key: key);

  @override
  _ExpandedWidgetIndexPageState createState() =>
      _ExpandedWidgetIndexPageState();
}

class _ExpandedWidgetIndexPageState extends State<ExpandedWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scanfold = Scaffold(
      appBar: AppBar(
        title: Text("Expanded"),
      ),
      body: ListView(
        children: [
          ExpandedRowDemo(),

          // Column示例
          Container(
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.layers,
                  color: Colors.pinkAccent,
                ),
                title: Text("Column"),
              )),
          ExpandedColumnDemo(),

          // 结合flex使用
          ListTile(
            leading: Icon(Icons.layers, color: Colors.pinkAccent),
            title: Text("Flex"),
          ),
          ExpandedFlexDemo(),
        ],
      ),
    );
    return Container(
      child: scanfold,
    );
  }
}

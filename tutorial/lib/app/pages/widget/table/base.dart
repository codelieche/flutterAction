// 表格基本示例
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class TableBaseDemoPage extends StatefulWidget {
  TableBaseDemoPage({Key key}) : super(key: key);

  @override
  _TableBaseDemoPageState createState() => _TableBaseDemoPageState();
}

class _TableBaseDemoPageState extends State<TableBaseDemoPage> {
  TableRow buildTableRowHeader() {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.pinkAccent[200].withOpacity(0.9),
      ),
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Text(
            "ID",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Text(
            "名字",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Text(
            "年级",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Text(
            "描述",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  List<TableRow> buildTableRowsWidget() {
    List<TableRow> rowsWidget = [];

    // 遍历20条数据：
    for (var i = 1; i <= 80; i++) {
      var rowWidget = TableRow(
        decoration: BoxDecoration(
          color: i % 2 == 0
              ? Colors.pinkAccent[100].withOpacity(0.7)
              : Colors.pinkAccent[100].withOpacity(0.3),
        ),
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Text(
              "$i",
              style: TextStyle(fontSize: 13),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Text(
              "名字$i",
              style: TextStyle(fontSize: 13),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Text(
              "${9 + i}",
              style: TextStyle(fontSize: 13),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Text(
              "描述内容$i",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      );

      // 添加组件到数组中
      rowsWidget.add(rowWidget);
    }

    // 返回数组
    return rowsWidget;
  }

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Container(
      child: Column(
        children: [
          SimpleTitleWidget(
            title: "基本使用",
            description:
                "Table(columnWidths: {}, border, TableBorder.all(), children: [])",
          ),
          Table(
            // 设置列的宽度
            columnWidths: {
              0: FixedColumnWidth(50),
              1: FixedColumnWidth(100),
              2: FixedColumnWidth(50),
              3: FlexColumnWidth(1),
            },
            // 设置边框
            border: TableBorder.all(
              width: 0.5,
              color: Colors.white70,
            ),
            children: [
              buildTableRowHeader(),
              // 20行数据
              ...buildTableRowsWidget(),
            ],
          )
        ],
      ),
    );

    // 包裹ScrollView
    body = SingleChildScrollView(
      child: body,
      physics: AlwaysScrollableScrollPhysics(),
    );

    // 返回
    return body;
  }
}

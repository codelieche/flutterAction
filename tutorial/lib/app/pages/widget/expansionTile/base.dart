// ExpansionTile 展开闭合基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ExpansionTileBaseDemoPage extends StatefulWidget {
  ExpansionTileBaseDemoPage({Key key}) : super(key: key);

  @override
  _ExpansionTileBaseDemoPageState createState() =>
      _ExpansionTileBaseDemoPageState();
}

class _ExpansionTileBaseDemoPageState extends State<ExpansionTileBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 示例的信息items
    List<Widget> infoItems = [
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("第一条信息"),
      ),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("第二条信息"),
      ),
      ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text("第三条信息"),
      )
    ];

    // 主体内容
    Widget body = Column(
      children: [
        // 基本示例
        SimpleTitleWidget(title: "基本使用", description: "ExpansionTile()"),
        ExpansionTile(
          title: Text("点击展开/闭合(默认)"),
          leading: Icon(Icons.menu),
          backgroundColor: Colors.white12,
          children: infoItems,
        ),

        // 设置展开
        SimpleTitleWidget(
          title: "设置展开",
          description: "ExpansionTile.initiallyExpanded: false(默认)/true",
        ),
        ExpansionTile(
          initiallyExpanded: true,
          title: Text("点击展开/闭合"),
          leading: Icon(Icons.apps),
          backgroundColor: Colors.white12,
          children: infoItems,
        ),

        // 展开事件
        SimpleTitleWidget(
          title: "展开事件",
          description: "ExpansionTile.onExpansionChanged:(value){}",
        ),
        ExpansionTile(
          initiallyExpanded: false,
          title: Text("展开事件"),
          leading: Icon(Icons.widgets),
          backgroundColor: Colors.white12,
          onExpansionChanged: (value) {
            print("当前展开状态：$value");
          },
          children: infoItems,
        ),
      ],
    );
    // 返回
    return SingleChildScrollView(
      child: body,
      physics: AlwaysScrollableScrollPhysics(),
    );
  }
}

// ExpansionPanelList
import 'package:flutter/material.dart';

class ExpansionPanelListBaseDemoPage extends StatefulWidget {
  ExpansionPanelListBaseDemoPage({Key key}) : super(key: key);

  @override
  _ExpansionPanelListBaseDemoPageState createState() =>
      _ExpansionPanelListBaseDemoPageState();
}

class _ExpansionPanelListBaseDemoPageState
    extends State<ExpansionPanelListBaseDemoPage> {
  // 要渲染的数据列表
  List<DataItem> dataSource = List.generate(20, (index) {
    return DataItem(
      index,
      "name:$index",
      "description: $index",
      false,
      "info",
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        // 设置是否展开(记得取反):
        dataSource[index].isOpen = !isExpanded;
        // 设置状态后，才会重新渲染
        setState(() {
          dataSource = dataSource;
        });
      },
      children: dataSource.map((item) {
        return ExpansionPanel(
          canTapOnHeader: true, // 能否点击header就展开，默认是false
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text("显示的标题:${item.id}"),
            );
          },
          body: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Divider(),
                Text("${item.description}"),
              ],
            ),
          ),
          isExpanded: item.isOpen, // 是否是展开的
        );
      }).toList(),
    );

    // 返回
    return SingleChildScrollView(
      child: body,
      physics: AlwaysScrollableScrollPhysics(),
    );
  }
}

// 展开闭合的Item
class DataItem {
  int id;
  String name;
  String description;
  bool isOpen;
  Object info;

  DataItem(this.id, this.name, this.description, this.isOpen, this.info);
}

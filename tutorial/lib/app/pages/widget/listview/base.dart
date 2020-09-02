// ListView基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ListViewBaseDemoPage extends StatefulWidget {
  ListViewBaseDemoPage({Key key}) : super(key: key);

  @override
  _ListViewBaseDemoPageState createState() => _ListViewBaseDemoPageState();
}

class _ListViewBaseDemoPageState extends State<ListViewBaseDemoPage> {
  // 颜色列表
  List<Color> colors = [
    Colors.grey[300],
    Colors.blue,
    Colors.yellowAccent,
    Colors.grey[300],
    Colors.deepOrange
  ];
  // ListView中的items
  List<Widget> items = [];

  @override
  void initState() {
    super.initState();
    for (var colorItem in colors) {
      var item = Container(
        width: 100,
        height: 100,
        color: colorItem,
      );
      items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 纵向
          SimpleTitleWidget(
            title: "纵向(默认):vertical",
          ),

          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.vertical, // 方向：默认是纵向
              children: [
                // item元素列表
                ...items,
                ...items,
                ...items,
              ],
            ),
          ),

          // 横向
          SimpleTitleWidget(
            title: "横向:horizontal",
          ),

          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal, // 方向：默认是纵向
              children: [
                // item元素列表
                ...items,
                ...items,
                ...items,
              ],
            ),
          ),

          // Builder
          SimpleTitleWidget(
            title: "builder",
          ),

          Container(
            height: 200,
            color: Colors.lightBlue[100],
            child: ListView.builder(
                itemCount: colors.length, itemBuilder: this.buildItems),
          )
        ],
      ),
    );
  }

  Widget buildItems(BuildContext context, int index) {
    // 获取到颜色
    var c = colors[index];

    return Container(
      color: c,
      child: ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(
          "Item:${index + 1}",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

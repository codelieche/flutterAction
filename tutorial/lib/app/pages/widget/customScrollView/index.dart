// CustomScrollView示例

import 'package:flutter/material.dart';

// 示例
import 'gridAndList.dart';
import 'pengyouquan.dart';

class CustomScrollViewDemoIndexPage extends StatefulWidget {
  CustomScrollViewDemoIndexPage({Key key}) : super(key: key);

  @override
  _CustomScrollViewDemoIndexPageState createState() =>
      _CustomScrollViewDemoIndexPageState();
}

class _CustomScrollViewDemoIndexPageState
    extends State<CustomScrollViewDemoIndexPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: [
          // 网格和列表
          ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("网格和列表，整体滑动"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CustomScrollViewGridListDemo();
              }));
            },
          ),

          // 朋友圈示例
          ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("朋友圈效果"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CustomScrollViewDemoPengyouquan();
              }));
            },
          ),

          // 示例2：
        ],
      ),
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollView"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

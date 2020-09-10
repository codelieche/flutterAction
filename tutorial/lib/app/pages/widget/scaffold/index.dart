//  Scaffold相关的组件示例
//  路由：/widget/scaffold/index
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

// 底部导航示例：
import 'bottomNavigationBar/demo01.dart';

class ScaffoldWidgetIndexPage extends StatefulWidget {
  @override
  _ScaffoldWidgetIndexPageState createState() =>
      _ScaffoldWidgetIndexPageState();
}

class _ScaffoldWidgetIndexPageState extends State<ScaffoldWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 页面主体内容
    Widget body = ListView(
      children: [
        // appBar
        SimpleTitleWidget(
          title: "顶部导航",
          description: "appBar",
        ),
        // 示例列表
        Wrap(
          children: [
            // 示例1：
            RaisedButton(
              onPressed: () {
                print("示例1");
              },
              highlightColor: Colors.white,
            ),
          ],
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("appBar"),
          onTap: () {
            print("app bar");
          },
        ),
        Divider(),
        // bottomNavigationBar
        SimpleTitleWidget(
          title: "底部导航",
          description: "bottomNavigationBar",
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("bottomNavigationBar:示例01"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext ctx) {
              return BottomNavigationBarDemoPage01();
            }));
          },
        ),
      ],
    );
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
      ),
      body: body,
    );

    return scaffold;
  }
}

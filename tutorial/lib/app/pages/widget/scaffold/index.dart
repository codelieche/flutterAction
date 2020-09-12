//  Scaffold相关的组件示例
//  路由：/widget/scaffold/index
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

// 顶部导航示例
import 'appBar/color.dart';
import 'appBar/leading.dart';
import 'appBar/actions.dart';

// 底部导航示例：
import 'bottomNavigationBar/demo01.dart';
import 'bottomNavigationBar/demo02.dart';
import 'bottomNavigationBar/demo03.dart';

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
            // 示例1: 设置颜色
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ScaffoldAppBarSetColorDemo();
                }));
              },
              child: Text("设置颜色"),
              textColor: Colors.white,
              color: Colors.pinkAccent,
            ),

            SizedBox(width: 20),

            // 示例2: 设置左边菜单
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ScaffoldAppBarLeadingDemo();
                }));
              },
              child: Text("设置左边菜单"),
              textColor: Colors.white,
              color: Colors.lightBlue,
            ),

            SizedBox(width: 20),

            // 示例3: 设置右边菜单
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ScaffoldAppBarAcitonsDemo();
                }));
              },
              child: Text("设置右侧菜单"),
              textColor: Colors.white,
              color: Colors.green,
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
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("bottomNavigationBar:示例02"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext ctx) {
              return BottomNavigationBarDemoPage02();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("不规则底部导航:示例03"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext ctx) {
              return BottomNavigationBarDemoPage03();
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

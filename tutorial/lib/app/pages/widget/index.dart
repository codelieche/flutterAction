import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// tab对应的页面
import 'simple.dart';
import 'layout.dart';
import 'form.dart';
import 'complex.dart';

class WidgetIndexPage extends StatefulWidget {
  @override
  _WidgetIndexPageState createState() => _WidgetIndexPageState();
}

class _WidgetIndexPageState extends State<WidgetIndexPage> {
  List<Widget> _tabs = [];
  @override
  Widget build(BuildContext context) {
    // tabs：
    _tabs = [
      Tab(
        // icon: Icon(Icons.border_all),
        text: "基础组件",
      ),
      Tab(
        // icon: Icon(Icons.border_all),
        text: "布局组件",
      ),
      Tab(
        // icon: Icon(Icons.airplay),
        text: "表单组件",
      ),
      Tab(
        // icon: Icon(Icons.airplay),
        text: "复合组件",
      ),
      Tab(
        text: "测试组件",
      )
    ];
    // 头部的tabBar
    TabBar tabBar = TabBar(
      unselectedLabelColor: Colors.grey[600],
      labelColor: AppPrimaryColor,
      indicatorSize: TabBarIndicatorSize.tab, // 指示器大小，默认是tab
      indicatorColor: Colors.lightBlue,
      isScrollable: true, // 默认是false, 当很多tab的时候就设置为true
      tabs: _tabs,
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: AppPrimaryColor,
          ),
          onPressed: () {
            print("左侧的菜单被点击了");
          },
        ),
        title: Text(
          "组件示例",
          style: TextStyle(color: AppPrimaryColor),
        ),
        bottom: tabBar,
        bottomOpacity: 1.0,
        elevation: 1.0,
      ),
      body: TabBarView(
        children: [
          SimpleWidgetPage(), // 基础组件
          LayoutWidgetIndexPage(), // 布局组件
          FormWidgetIndexPage(), // 表单组件
          ComplexWidgetIndexPage(), // 复杂组件
          BaseComponentIndexPage(),
        ],
      ),
    );

    // 脚手架记得加个TabController
    return DefaultTabController(
      length: _tabs.length,
      child: scaffold,
    );
  }
}

class BaseComponentIndexPage extends StatefulWidget {
  @override
  _BaseComponentIndexPageState createState() => _BaseComponentIndexPageState();
}

class _BaseComponentIndexPageState extends State<BaseComponentIndexPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              height: 400,
              color: Colors.pinkAccent,
            ),
            Container(
              height: 400,
              color: Colors.lightBlue,
            ),
            Container(
              height: 400,
              color: Colors.yellow,
            )
          ],
        )
      ],
    );
  }
}

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

class _WidgetIndexPageState extends State<WidgetIndexPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // 当前选中的tab的index
  List<Widget> _tabs = []; // Tab列表
  TabBar _tabBar; // TabBar
  TabController _tabController; // Tab控制器
  VoidCallback _onChange; // TabController监听的事件

  @override
  void initState() {
    super.initState();
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

    // 实例化Tab控制器
    _tabController = TabController(
        initialIndex: _currentIndex, length: _tabs.length, vsync: this);

    // 当Tab变更的时候处理函数
    _onChange = () {
      // print(this._tabController.index);
      if (_currentIndex != this._tabController.index) {
        setState(() {
          _currentIndex = this._tabController.index;
        });
      }
    };
    // Tab控制器监听事件
    _tabController.addListener(_onChange);

    // 头部的tabBar
    _tabBar = TabBar(
      labelColor: AppPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      indicatorSize: TabBarIndicatorSize.tab, // 指示器大小，默认是tab
      indicatorColor: Colors.lightBlue,
      isScrollable: true, // 默认是false, 当很多tab的时候就设置为true
      tabs: _tabs,
      controller: _tabController,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        bottom: _tabBar,
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
        controller: _tabController,
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

// Tab基本页面
// 1. 基本：Text("Base")
// 2. 测试：Text("Test")
import 'package:flutter/material.dart';
import 'package:tutorial/app/pages/page/forms/selecteDemo.dart';
import 'package:tutorial/app/variables.dart';

import 'base.dart';
import './selecteDemo.dart';
import 'selectedDisplay.dart';

class PageFormsDemoPage extends StatefulWidget {
  PageFormsDemoPage({Key key}) : super(key: key);

  @override
  _PageFormsDemoPageState createState() => _PageFormsDemoPageState();
}

class _PageFormsDemoPageState extends State<PageFormsDemoPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // 当前选中的tab的index
  List<Widget> _tabs = []; // tab列表
  TabBar _tabBar; // TabBar
  TabController _tabController; // Tab哦控制器
  VoidCallback _onChange; // TabController监听的事件

  @override
  void initState() {
    super.initState();
    // tabs
    _tabs = [
      Tab(text: "基本"),
      Tab(text: "弹出选择值"),
      Tab(text: "选中的值展示"),
    ];

    // 实例化Tab控制器
    _tabController = TabController(length: _tabs.length, vsync: this);

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

    // tabBar
    _tabBar = TabBar(
      labelColor: AppPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      tabs: _tabs,
      isScrollable: true, // 是否可滑动
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
        title: Text("表单"),
        elevation: 1.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          // 因为会设置可滚动，那么需要让里面的container填充整个横向：
          // 使用Flex + Expanded + Containerr
          child: Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: _tabBar,
              ),
            )
          ]),
        ),
      ),
      body: TabBarView(
        children: [
          SelecteValuesBaseDemo(),
          BaseSelectValuesWidgetDemoPage(),
          SelectedValuesDisplayDemoPage(),
        ],
        controller: _tabController,
      ),
    );

    // 返回
    return DefaultTabController(length: _tabs.length, child: scaffold);
  }
}

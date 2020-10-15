/**
 * ListView相关的示例
 * 路由：/widget/listview/index
 */
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// 基本使用
import 'base.dart';
import 'demo01.dart';
import 'scrollController.dart';

class ListViewWidgetIndexPage extends StatefulWidget {
  @override
  _ListViewWidgetIndexPageState createState() =>
      _ListViewWidgetIndexPageState();
}

class _ListViewWidgetIndexPageState extends State<ListViewWidgetIndexPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // 当前选中的tab的index
  List<Widget> _tabs = []; // tab列表
  TabBar _tabBar; // TabBar
  TabController _tabController; // Tab控制器
  VoidCallback _onChange; // TabController监听的事件

  @override
  void initState() {
    super.initState();

    // tabs
    _tabs = [
      Tab(text: "基本使用"),
      Tab(text: "示例1"),
      Tab(text: "ScrollController"),
    ];

    // TabController
    _tabController = TabController(
        initialIndex: _currentIndex, length: _tabs.length, vsync: this);

    // onChange
    _onChange = () {
      // print(this._tabController.index);
      if (_currentIndex != this._tabController.index) {
        setState(() {
          _currentIndex = this._tabController.index;
        });
      }
    };

    _tabController.addListener(_onChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // tabBar
    _tabBar = TabBar(
      labelColor: AppPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      tabs: _tabs,
      isScrollable: true, // 默认是false
      controller: _tabController,
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
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
            ))
          ]),
        ),
      ),
      body: TabBarView(
        children: [
          ListViewBaseDemoPage(),
          ListViewDemo01Page(),
          ScrollControllerDemoPage(),
        ],
        controller: _tabController,
      ),
    );

    // 返回
    return DefaultTabController(length: _tabs.length, child: scaffold);
  }
}

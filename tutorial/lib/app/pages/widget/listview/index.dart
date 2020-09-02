/**
 * ListView相关的示例
 * 路由：/widget/listview/index
 */
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// 基本使用
import 'base.dart';
import 'demo01.dart';

class ListViewWidgetIndexPage extends StatefulWidget {
  @override
  _ListViewWidgetIndexPageState createState() =>
      _ListViewWidgetIndexPageState();
}

class _ListViewWidgetIndexPageState extends State<ListViewWidgetIndexPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabBar tabBar;
  TabController _tabController;
  VoidCallback _onChange;

  @override
  void initState() {
    super.initState();

    // TabController
    _tabController =
        TabController(initialIndex: _currentIndex, length: 2, vsync: this);

    // onChange
    _onChange = () {
      setState(() {
        _currentIndex = _tabController.index;
      });
    };

    _tabController.addListener(_onChange);
  }

  @override
  Widget build(BuildContext context) {
    // tabBar
    tabBar = TabBar(
      labelColor: AppPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      tabs: [
        Tab(
          text: "基本使用",
        ),
        Tab(
          text: "示例1",
        ),
      ],
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
              child: tabBar,
            ))
          ]),
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        ListViewBaseDemoPage(),
        ListViewDemo01Page(),
      ]),
    );

    // 返回
    return DefaultTabController(length: 2, child: scaffold);
  }
}

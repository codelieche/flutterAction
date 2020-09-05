/**
 * Wrap相关的组件示例
 * 路由：/widget/wrap/index
 */
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// 基本使用
import 'base.dart';
// 复合使用
import 'complex.dart';

class WrapWidgetIndexPage extends StatefulWidget {
  @override
  _WrapWidgetIndexPageState createState() => _WrapWidgetIndexPageState();
}

class _WrapWidgetIndexPageState extends State<WrapWidgetIndexPage>
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
      Tab(
        text: "基本使用",
      ),
      Tab(
        text: "复合使用",
      ),
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
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
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
        children: [WrapBaseDemoPage(), WrapComplexDemoPage()],
        controller: _tabController,
      ),
    );

    return DefaultTabController(length: _tabs.length, child: scaffold);
  }
}

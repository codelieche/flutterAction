import 'package:flutter/material.dart';
// 引入页面、Demo、第三方库首页
import '../common/index.dart';
import 'index.dart';
import '../demo/index.dart';
import '../third/index.dart';

class PageDemoThirdIndexPage extends StatefulWidget {
  @override
  _PageDemoThirdIndexPageState createState() => _PageDemoThirdIndexPageState();
}

class _PageDemoThirdIndexPageState extends State<PageDemoThirdIndexPage>
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
        text: "常用",
      ),
      Tab(
        text: "页面",
      ),
      Tab(
        text: "Demo",
      ),
      Tab(
        text: "第三方库",
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
      labelColor: Colors.pinkAccent,
      unselectedLabelColor: Colors.grey[600],
      tabs: _tabs,
      // isScrollable: true, // 是否可滑动
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
        backgroundColor: Colors.pinkAccent,
        title: Text("示例", style: TextStyle(color: Colors.white)),
        elevation: 1.0, // 阴影，默认是4.0
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
          CommonIndexPage(),
          PageIndexPage(),
          DemoIndexPage(),
          ThirdIndexPage(),
        ],
        controller: _tabController,
      ),
    );

    // 返回
    return DefaultTabController(
      length: _tabs.length,
      child: scaffold,
    );
  }
}

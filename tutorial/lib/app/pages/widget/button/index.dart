// 按钮相关的组件
// 路由：/widget/button/index
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// 引入各种按钮
import 'raisedButton.dart';
import 'flatButton.dart';
import 'outlineButton.dart';
import 'buttonBar.dart';
import 'floatingActionButton.dart';

class ButtonWidgetIndexPage extends StatefulWidget {
  @override
  _ButtonWidgetIndexPageState createState() => _ButtonWidgetIndexPageState();
}

class _ButtonWidgetIndexPageState extends State<ButtonWidgetIndexPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // 当前选中的tab的index
  List<Widget> _tabs = []; // tab列表
  TabBar _tabBar; // TabBar
  TabController _tabController; // Tab控制器
  VoidCallback _onChange; // TabController监听的事件

  @override
  void initState() {
    super.initState();
    // _tabs
    _tabs = [
      Tab(text: "RaisedButton"), // 凸起按钮
      Tab(text: "FlatButton"), // 扁平按钮
      Tab(text: "OutLineButton"), // 线宽按钮
      Tab(text: "IconButton"), // 图标按钮
      Tab(text: "ButtonBar"), // 按钮组
      Tab(text: "FloatingActionButton") // 浮动按钮
    ];

    // 实例化Tab控制器
    _tabController = TabController(
      initialIndex: _currentIndex,
      length: _tabs.length,
      vsync: this,
    );

    // 当前Tab变更的时候处理函数
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
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Button"),
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
        controller: _tabController,
        children: [
          RaisedButtonDemoPage(),
          FlatButtonDemoPage(),
          OutLineButtonDemoPage(),
          Text("IconButton主要用于appBar的actions"),
          ButtonBarDemoPage(),
          FloatingActionButtonDemoPage(),
        ],
      ),
    );

    return DefaultTabController(length: _tabs.length, child: scaffold);
  }
}

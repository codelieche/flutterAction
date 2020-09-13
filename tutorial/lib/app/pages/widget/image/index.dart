/**
 * 图片相关示例组件的首页
 * 路由：/widget/image/index
 */
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// Base:基本使用
import 'base.dart';
import 'fit.dart';

class ImageWidgetIndexPage extends StatefulWidget {
  @override
  _ImageWidgetIndexPageState createState() => _ImageWidgetIndexPageState();
}

class _ImageWidgetIndexPageState extends State<ImageWidgetIndexPage>
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
        text: "填充方式",
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

    // TabBar
    _tabBar = TabBar(
      labelColor: AppPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      tabs: _tabs,
      controller: _tabController,
      isScrollable: true,
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
        title: Text("Image"),
        elevation: 1.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          // 因为会设置可滚动，那么需要让里面的container填充整个横向：
          // 使用Flex + Expanded + Containerr
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: _tabBar,
                ),
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        children: [
          ImageBaseDemoPage(),
          ImageFitDemoPage(),
        ],
        controller: _tabController,
      ),
    );
    // 返回
    return DefaultTabController(length: _tabs.length, child: scaffold);
  }
}

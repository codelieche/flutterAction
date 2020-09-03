/**
 * Row相关的组件示例
 * 路由：/widget/row/index
 */
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';
import 'base.dart';
import 'mainAxis.dart';
import 'crossAxis.dart';

class RowWidgetIndexPage extends StatefulWidget {
  @override
  _RowWidgetIndexPageState createState() => _RowWidgetIndexPageState();
}

class _RowWidgetIndexPageState extends State<RowWidgetIndexPage>
    with SingleTickerProviderStateMixin {
  // tab选择的index
  int _currentIndex = 0;
  TabBar _tabBar;
  TabController _tabController;
  VoidCallback _onChange;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: _currentIndex);

    _onChange = () {
      print(this._tabController.index);
    };

    // 监听事件
    _tabController.addListener(_onChange);
  }

  @override
  Widget build(BuildContext context) {
    // tabBar
    _tabBar = TabBar(
      labelColor: AppPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      tabs: [
        Tab(
          text: "基本使用",
        ),
        Tab(
          text: "主(横)轴对其",
        ),
        Tab(
          text: "辅(纵)轴对其",
        ),
      ],
      isScrollable: true, // 是否可滑动
    );
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Row"),
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
      body: TabBarView(children: [
        RowBaseDemoPage(),
        RowMainAxisDemoPage(),
        RowCrossAxisDemoPage(),
      ]),
    );

    return DefaultTabController(length: 3, child: scaffold);
  }
}

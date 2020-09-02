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
  int _currentIndex = 0;
  TabBar tabBar;
  TabController _tabController;
  VoidCallback onChange;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: _currentIndex, length: 2, vsync: this);

    onChange = () {
      print(this._tabController.index);
    };

    _tabController.addListener(onChange);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabBar = TabBar(
      labelColor: AppPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      tabs: [
        Tab(
          text: "基本使用",
        ),
        Tab(
          text: "填充方式",
        ),
      ],
      controller: _tabController,
      isScrollable: true,
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Image"),
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
      body: TabBarView(
        children: [
          ImageBaseDemoPage(),
          ImageFitDemoPage(),
        ],
        controller: _tabController,
      ),
    );
    // 返回
    return DefaultTabController(length: 2, child: scaffold);
  }
}

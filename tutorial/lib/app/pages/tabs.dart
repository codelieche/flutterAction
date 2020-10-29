/**
 * App的首屏
 */
import 'package:flutter/material.dart';

import 'package:tutorial/app/variables.dart';
// 导入页面
import 'home/index.dart';
import 'widget/index.dart';
import 'page/shiliIndex.dart';
import 'user/index.dart';

class AppHomeTabs extends StatefulWidget {
  final int currentIndex; // 当前选中的导航bar的索引

  // 构造方法
  AppHomeTabs({Key key, this.currentIndex = 0}) : super(key: key);

  @override
  _AppHomeTabsState createState() => _AppHomeTabsState();
}

class _AppHomeTabsState extends State<AppHomeTabs> {
  int _currentBarIndex; // 当前选中的导航bar的索引
  List<Widget> _bodyPages = []; // 导航bar对应的页面
  PageController _pageController; // 页面控制器

  @override
  void initState() {
    super.initState();

    // 初始化页面使用widget传递的currentIndex
    _pageController = PageController(initialPage: widget.currentIndex);

    // app的初始化页面
    _bodyPages = [
      HomeIndexPage(),
      WidgetIndexPage(),
      PageDemoThirdIndexPage(),
      UserIndexPage(),
    ];
    // print("init state");

    if (_currentBarIndex != widget.currentIndex) {
      setState(() {
        _currentBarIndex = widget.currentIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 底部导航的bar
    BottomNavigationBar appNavigationBar = BottomNavigationBar(
      currentIndex: _currentBarIndex, // 当前选中的bar
      items: [
        // 底部导航的tab选项
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // title: Text("首页"),
            label: "首页"),
        BottomNavigationBarItem(
          // 基本组件的使用示例
          icon: Icon(Icons.widgets),
          // title: Text("组件"),
          label: "组件",
        ),
        BottomNavigationBarItem(
          // 整个页面的示例：比如：登录页、注册、用户也等
          icon: Icon(Icons.code),
          // title: Text("示例"),
          label: "示例",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          // title: Text("用户"),
          label: "用户",
        ),
      ], // 导航bar列表

      onTap: (index) {
        // 切换底部导航
        setState(() {
          // 设置新的选中导航bar
          _currentBarIndex = index;

          // 页面控制器跳转页面
          _pageController.jumpToPage(index);
        });
      },
      iconSize: 24.0, // 图标icon的大小
      selectedFontSize: 12, // 选中的文字大小: 默认是14
      unselectedFontSize: 12, // 未选中的文字大小：默认是12
      fixedColor: AppPrimaryColor, // 选中的颜色
      type: BottomNavigationBarType.fixed, // 配置底部bars可以有多个按钮
    );

    // 首页的脚手架页面
    Scaffold appRouteTabsScaffold = Scaffold(
      // body: _bodyPages[_currentBarIndex], // 主体内容
      body: PageView(
        controller: _pageController,
        children: _bodyPages,
      ),

      bottomNavigationBar: appNavigationBar, // 底部导航
    );

    return appRouteTabsScaffold;
  }
}

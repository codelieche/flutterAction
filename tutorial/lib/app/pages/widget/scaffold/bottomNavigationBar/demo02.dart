// Scaffold的bottomNavigationBar
// 常见的属性
// items: List<BottomNavigationBarItem> 底部导航条按钮集合
// iconSize：icon的大小
// currentIndex: 默认选中第几个
// onTap：选中变化回调函数
// fixedColor: 选中颜色
// type：BottomNavigationBarType.fixed/shifting
import 'package:flutter/material.dart';

class BottomNavigationBarDemoPage02 extends StatefulWidget {
  BottomNavigationBarDemoPage02({Key key}) : super(key: key);

  @override
  _BottomNavigationBarDemoPage02State createState() =>
      _BottomNavigationBarDemoPage02State();
}

class _BottomNavigationBarDemoPage02State
    extends State<BottomNavigationBarDemoPage02> {
  int _currentBarIndex = 0; // 当前选中的导航bar
  List<Widget> _bodyPages = []; // 导航bar对应的页面
  PageController _pageController = PageController(); // PageView控制器

  @override
  void initState() {
    super.initState();

    // app的初始页面
    _bodyPages = [
      Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: Center(
          child: Text("Hello index Page"),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          title: Text("菜单页"),
        ),
        body: Center(
          child: Text("Hello menu Page"),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          title: Text("设置页"),
        ),
        body: Center(
          child: Text("Hello settings Page"),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text("用户页"),
        ),
        body: Center(
          child: Text("Hello user Page"),
        ),
      ),
    ];
  }

  Widget build(BuildContext context) {
    // 底部导航
    BottomNavigationBar appNavigationBar = BottomNavigationBar(
      currentIndex: _currentBarIndex, // 当前选中的bar
      items: [
        // 底部导航的tab选项
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
        BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text("菜单")),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置")),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("用户"),
        ),
      ],
      onTap: (index) {
        // 切换底部导航
        setState(() {
          // 设置选中的导航bar
          _currentBarIndex = index;
        });

        // 页面控制器跳转页面
        _pageController.jumpToPage(index);
      },
      iconSize: 24.0, // 图标icon的大小,
      selectedFontSize: 12, // 选中的文字大小，默认是14
      unselectedFontSize: 12, // 为选中的文字大小，默认是12
      fixedColor: Colors.pinkAccent, // 选中的bar颜色
      type: BottomNavigationBarType.fixed, // 配置底部bars可以有多个按钮
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      // appBar: AppBar(
      //   title: Text("底部导航"),
      // ),
      // body: _bodyPages[_currentBarIndex], // 主体内容: 不包裹PageView
      body: PageView(
        controller: _pageController,
        children: _bodyPages,
        onPageChanged: (index) {
          setState(() {
            _currentBarIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("floatingActionButton");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: appNavigationBar, // 底部导航
    );
    return scaffold;
  }
}

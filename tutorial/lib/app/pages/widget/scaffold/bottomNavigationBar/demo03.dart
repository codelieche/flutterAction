// Scaffold的bottomNavigationBar
// 常见的属性
// items: List<BottomNavigationBarItem> 底部导航条按钮集合
// iconSize：icon的大小
// currentIndex: 默认选中第几个
// onTap：选中变化回调函数
// fixedColor: 选中颜色
// type：BottomNavigationBarType.fixed/shifting
import 'package:flutter/material.dart';

class BottomNavigationBarDemoPage03 extends StatefulWidget {
  BottomNavigationBarDemoPage03({Key key}) : super(key: key);

  @override
  _BottomNavigationBarDemoPage03State createState() =>
      _BottomNavigationBarDemoPage03State();
}

class _BottomNavigationBarDemoPage03State
    extends State<BottomNavigationBarDemoPage03> {
  int _currentBarIndex = 0; // 当前选中的导航bar
  List<Widget> _bodyPages = []; // 导航bar对应的页面

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
    List<Widget> _barItems = [
      IconButton(
        icon: Icon(
          Icons.home,
          color: _currentBarIndex == 0 ? Colors.pinkAccent : Colors.grey[600],
        ),
        onPressed: () {
          setState(() {
            _currentBarIndex = 0;
          });
        },
      ),
      IconButton(
        icon: Icon(
          Icons.apps,
          color: _currentBarIndex == 1 ? Colors.pinkAccent : Colors.grey[600],
        ),
        onPressed: () {
          setState(() {
            _currentBarIndex = 1;
          });
        },
      ),
      IconButton(
        icon: Icon(
          Icons.settings,
          color: _currentBarIndex == 2 ? Colors.pinkAccent : Colors.grey[600],
        ),
        onPressed: () {
          setState(() {
            _currentBarIndex = 2;
          });
        },
      ),
      IconButton(
        icon: Icon(
          Icons.account_circle,
          color: _currentBarIndex == 3 ? Colors.pinkAccent : Colors.grey[600],
        ),
        onPressed: () {
          setState(() {
            _currentBarIndex = 3;
          });
        },
      ),
    ];

    // BottomNavigationBar appNavigationBar = BottomNavigationBar(
    //   currentIndex: _currentBarIndex, // 当前选中的bar
    //   items: [
    //     // 底部导航的tab选项
    //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    //     BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text("菜单")),
    //     BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置")),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.account_circle),
    //       title: Text("用户"),
    //     ),
    //   ],
    //   onTap: (index) {
    //     // 切换底部导航
    //     setState(() {
    //       // 设置选中的导航bar
    //       _currentBarIndex = index;
    //     });
    //   },
    //   iconSize: 24.0, // 图标icon的大小,
    //   selectedFontSize: 12, // 选中的文字大小，默认是14
    //   unselectedFontSize: 12, // 为选中的文字大小，默认是12
    //   fixedColor: Colors.pinkAccent, // 选中的bar颜色
    //   type: BottomNavigationBarType.fixed, // 配置底部bars可以有多个按钮
    // );
    // 脚手架
    Scaffold scaffold = Scaffold(
      // appBar: AppBar(
      //   title: Text("底部导航"),
      // ),
      body: _bodyPages[_currentBarIndex], // 主体内容

      // 浮动按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("floatingActionButton");
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("add页面"),
              ),
              body: Center(
                child: Text("Hello Add Page"),
              ),
            );
          }));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottomNavigationBar: appNavigationBar, // 底部导航
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _barItems,
        ),
      ), // 底部导航
    );
    return scaffold;
  }
}

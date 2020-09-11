// FloatingActionButton
// 浮动的按钮
import 'package:flutter/material.dart';

class FloatingActionButtonDemoPage extends StatefulWidget {
  FloatingActionButtonDemoPage({Key key}) : super(key: key);

  @override
  _FloatingActionButtonDemoPageState createState() =>
      _FloatingActionButtonDemoPageState();
}

class _FloatingActionButtonDemoPageState
    extends State<FloatingActionButtonDemoPage> {
  int _currentIndex = 0; // 当前选中的tab的索引
  @override
  Widget build(BuildContext context) {
    // 脚手架
    Scaffold scaffold = Scaffold(
      body: Center(child: Text("Hello FloatingActionButton")),

      // 浮动按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.add, color: Colors.white),
          onPressed: () {},
        ),
      ),

      // 浮动按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,

      // 底部的导航
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text("菜单")),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("我")),
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        selectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );

    // 返回
    return scaffold;
  }
}

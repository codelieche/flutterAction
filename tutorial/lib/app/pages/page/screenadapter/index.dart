// 屏幕适配
import 'package:flutter/material.dart';
import 'package:tutorial/app/utils/screen/adapter.dart';

// 引入示例
import 'ratio.dart';
import 'scrreenUtil.dart';

class ScreenAdapterIndexPage extends StatefulWidget {
  ScreenAdapterIndexPage({Key key}) : super(key: key);

  @override
  _ScreenAdapterIndexPageState createState() => _ScreenAdapterIndexPageState();
}

class _ScreenAdapterIndexPageState extends State<ScreenAdapterIndexPage> {
  int _currentBarIndex = 0; // 当前选中的bar的index
  List<Widget> _bodyPages = []; // 页面列表

  @override
  Widget build(BuildContext context) {
    // 页面数组
    _bodyPages = [
      ScreenAdapterRatioPage(),
      ScreenAdapterScreenUtilPage(),
    ];

    // 必须初始化一下
    ScreenAdapter.init(context);

    // 底部bar
    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      currentIndex: _currentBarIndex, // 当前选中的bar索引
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.aspect_ratio), title: Text("Ratio")),
        BottomNavigationBarItem(
            icon: Icon(Icons.panorama_wide_angle), title: Text("ScreenUtil")),
      ],
      onTap: (value) {
        setState(() {
          _currentBarIndex = value;
        });
      },
      iconSize: 22,
      selectedFontSize: 12,
      fixedColor: Colors.pinkAccent,
      backgroundColor: Colors.white,
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      body: _bodyPages[_currentBarIndex],
      bottomNavigationBar: bottomNavigationBar,
    );

    // 返回
    return scaffold;
  }
}

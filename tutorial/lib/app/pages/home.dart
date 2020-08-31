/**
 * App的首页
 * 主要是包含了底部的导航，以及各导航指向啥页面
 */
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';
// 导入页面
import 'home/index.dart';
import 'code/index.dart';
import 'page/index.dart';
import 'user/index.dart';

// app的主体颜色: 放入variables.dart中
//Color AppPrimaryColor = Color.fromRGBO(74, 144, 226, 1);


class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}


class _AppHomePageState extends State<AppHomePage> {
  int _currentBarIndex = 3;  // 当前选中的导航bar的索引
  List<Widget> _bodyPages = [];  // 导航bar对应的页面

  @override
  void initState() {

    super.initState();

    // app的初始化页面
    _bodyPages = [
      HomeIndexPage(),
      CodeIndexPage(),
      PageDemoIndexPage(),
      UserIndexPage(),
    ];
    print("init state");
  }

  @override
  Widget build(BuildContext context) {

    // 底部导航的bar
    BottomNavigationBar appNavigationBar = BottomNavigationBar(
      currentIndex: _currentBarIndex,  // 当前选中的bar
      items: [          // 底部导航的tab选项
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("首页")
        ),
        BottomNavigationBarItem(  // 基本组件的使用示例
          icon: Icon(Icons.code),
          title: Text("组件示例"),
        ),
        BottomNavigationBarItem(  // 整个页面的示例：比如：登录页、注册、用户也等
          icon: Icon(Icons.pages),
          title: Text("页面示例"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("设置"),
        ),
      ],  // 导航bar列表

      onTap: (index){   // 切换底部导航
        setState(() {
          // 设置新的选中导航bar
          _currentBarIndex = index;
        });
      },

      iconSize: 24.0,                            // 图标icon的大小
      selectedFontSize: 12,                      // 选中的文字大小: 默认是14
      unselectedFontSize: 12,                    // 未选中的文字大小：默认是12
      fixedColor: AppPrimaryColor,               // 选中的颜色
      type: BottomNavigationBarType.fixed,       // 配置底部bars可以有多个按钮
    );

    // 首页的脚手架页面
    Scaffold homeScaffold = Scaffold(
//      appBar: AppBar(
//        backgroundColor: AppPrimaryColor,
//        title: Text("运维平台"),
//        elevation: 0.0,                       // 阴影，默认是4.0
//      ),
      body: _bodyPages[_currentBarIndex],     // 主体内容
      bottomNavigationBar: appNavigationBar,  // 底部导航
//      floatingActionButton: FloatingActionButton(
//        onPressed: (){
//          print("add 点击了");
//        },
//        tooltip: "提示",
//        child: Icon(
//          Icons.add,
//          color: Colors.white,
//        ),
//      ),

    );

    // 返回
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppPrimaryColor,
      ),
      home: homeScaffold,
    );
  }
}

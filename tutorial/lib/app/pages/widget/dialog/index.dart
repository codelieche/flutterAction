// 对话框
// AlertDialog、SimpDialog、showModalBottomSheetLog
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

// AlertDialog
import 'AlertDialog/index.dart';
// SimpleDialog
import 'simpleDialog/index.dart';
// showModalBottomSheet
import 'showModalBottomSheet/index.dart';
// showToast
import 'showToast/index.dart';
// snackBar
import 'snackBar/index.dart';

class DialogIndexPage extends StatefulWidget {
  DialogIndexPage({Key key}) : super(key: key);

  @override
  _DialogIndexPageState createState() => _DialogIndexPageState();
}

class _DialogIndexPageState extends State<DialogIndexPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // 当前选中的tab的index
  List<Widget> _tabs = []; // tab列表
  TabBar _tabBar; // Scaffold底部的TabBar
  TabController _tabController; // TabBar控制器
  VoidCallback _onChange; // TabController监听的事件

  @override
  void initState() {
    super.initState();
    // tab
    _tabs = [
      Tab(text: "AlertDialog"),
      Tab(text: "SimpleDialog"),
      Tab(text: "showModalBottomSheet"),
      Tab(text: "showToast"),
      Tab(text: "SnackBar"),
    ];

    // 实例化Tab控制器
    _tabController = TabController(length: _tabs.length, vsync: this);

    // 当Tab变更的时候处理函数
    _onChange = () {
      // print(this._tabController.index);
      if (this._tabController.index != _currentIndex) {
        setState(() {
          _currentIndex = this._tabController.index;
        });
      }
    };

    // tab控制器监听事件
    _tabController.addListener(_onChange);

    // 实例化TabBar
    _tabBar = TabBar(
      labelColor: AppPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      tabs: _tabs,
      isScrollable: true, // 是否可滑动
      controller: _tabController,
      indicatorSize: TabBarIndicatorSize.label, // 指示器的大小
    );
  }

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget _tabBarView = TabBarView(
      children: [
        AlertDialogIndexPage(),
        SimpleDialogIndexPage(),
        ShowModalBottomSheetIndexPage(),
        ShowToastIndexPage(),
        SnackBarIndexPage(),
      ],
      controller: _tabController,
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
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
        elevation: 1.0,
      ),
      body: _tabBarView,
    );

    // 返回
    return DefaultTabController(
      length: _tabs.length,
      child: scaffold,
    );
  }
}

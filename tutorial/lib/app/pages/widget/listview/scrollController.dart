// ScrollController

import 'package:flutter/material.dart';

class ScrollControllerDemoPage extends StatefulWidget {
  ScrollControllerDemoPage({Key key}) : super(key: key);

  @override
  _ScrollControllerDemoPageState createState() =>
      _ScrollControllerDemoPageState();
}

class _ScrollControllerDemoPageState extends State<ScrollControllerDemoPage> {
  ScrollController _scrollController = ScrollController();
  bool showGoToTop = false; // 显示去顶部的按钮
  double _offset = 0;
  double _maxScrollExtent = 0; // ListView最大距离

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset;
        _maxScrollExtent = _scrollController.position.maxScrollExtent;
      });
      if (_scrollController.offset > 1000) {
        if (!showGoToTop) {
          showGoToTop = true;
          setState(() {
            showGoToTop = showGoToTop;
          });
          print("当前ListView已经向下滚动了：${_scrollController.offset}");
          print(_scrollController.position.pixels);
          print(_scrollController.position.maxScrollExtent);
        }
      } else if (_scrollController.offset < 300) {
        if (showGoToTop) {
          showGoToTop = false;
          setState(() {
            showGoToTop = showGoToTop;
          });
          print("不要显示返回顶部的按钮");
          print(_scrollController.position.pixels);
          print(_scrollController.position.maxScrollExtent);
        }
      } else {}
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // 列表内容
    ListView listView = ListView.builder(
      controller: _scrollController, // 设置控制器
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("标题：${index + 1}"),
          subtitle: Text("Body: $index"),
        );
      },
      itemCount: 100,
      itemExtent: 50,
    );
    return Stack(
      children: [
        Container(
          child: listView,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: size.width,
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: Text("当前滚动位置：$_offset/$_maxScrollExtent",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
          ),
        ),
        Positioned(
          bottom: 10,
          child: showGoToTop
              ? Container(
                  padding: EdgeInsets.all(5),
                  width: size.width,
                  height: 60,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      _scrollController.animateTo(
                        0.0,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.lightBlue,
                          // size: 10.0,
                        ),
                        Text(
                          "回到顶部",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Text(""),
        ),
      ],
    );
  }
}

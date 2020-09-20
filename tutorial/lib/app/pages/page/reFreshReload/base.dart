// 下拉刷新、上拉加载
import 'dart:io';

import 'package:flutter/material.dart';

class ReFreshReloadBaseDemoPage extends StatefulWidget {
  ReFreshReloadBaseDemoPage({Key key}) : super(key: key);

  @override
  _ReFreshReloadBaseDemoPageState createState() =>
      _ReFreshReloadBaseDemoPageState();
}

class _ReFreshReloadBaseDemoPageState extends State<ReFreshReloadBaseDemoPage>
    with AutomaticKeepAliveClientMixin {
  // 加载数据
  int count = 0; // 总共数据条数
  int currentPage = 0; // 当前页
  int pageSize = 10; // 每次加载的数量
  List<Object> dataSource = []; // 数据列表
  bool isRequesting = false; // 是否正在请求数据
  bool hasNext = true; // 是否还有下一页
  bool canReload = true; // 是否可加载数据
  ScrollController _scrollController = ScrollController(); // Scroll滚动控制器

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 加载第一页数据
    fetchData(1);

    // 监听滚动事件
    _scrollController.addListener(() {
      // print("滚动事件");
      // print(_scrollController.position.pixels); // 滚动条下拉的距离
      // print(_scrollController.position.maxScrollExtent); // 滚动条整个滚动区的高度

      // 加载下一页数据
      if (hasNext && !isRequesting && canReload) {
        // print("有下一页");
        if (_scrollController.position.pixels > 0 &&
            _scrollController.position.pixels >
                _scrollController.position.maxScrollExtent - 20) {
          sleep(Duration(microseconds: 10));
          // 能否加载数据
          if (canReload) {
            canReload = false;
            sleep(Duration(milliseconds: 100));
            fetchData(currentPage + 1);
          }
        }
      } else {
        // print("没有下一页了");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 加载数据
  fetchData(int page) async {
    // 传入的页
    if (page == null || page <= 0) {
      page = 1;
    }

    if (isRequesting) {
      print("正在加载数据, 直接返回");
      // 正在加载数据
      return;
    } else {
      // isRequesting = true;
      setState(() {
        isRequesting = true;
      });
    }

    print("需要加载数据:$page");
    // 模拟延时加载
    Future.delayed(Duration(seconds: 1), () {
      // 模拟加载数据
      if (page == 1) {
        currentPage = 0;
      }
      List<Object> newData = List.generate(pageSize, (index) {
        return "Item${currentPage * pageSize + index}";
      }).toList();

      // 更新数据
      setState(() {
        currentPage = page;
      });
      // 更新列表数据
      if (page == 1) {
        // hasNext = true;
        // isRequesting = false;

        setState(() {
          dataSource = newData;
          hasNext = true;
          isRequesting = false;
        });
      } else {
        if (page < 5) {
          // 还有下一页
          hasNext = true;
        } else {
          hasNext = false; // 没有下一页了
        }

        // hasNext = hasNext;
        // canReload = true;
        // isRequesting = false;

        setState(() {
          dataSource..addAll(newData);
          hasNext = hasNext;
          canReload = true;
          isRequesting = false;
        });
      }
    });
  }

  Future<Object> _onRefresh() async {
    print("下拉刷新");
    await Future.delayed(Duration(microseconds: 1000), () {
      fetchData(1);
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // 页面主体内容
    Widget listView, body;

    if (dataSource.length > 0) {
      listView = ListView.builder(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(), // 少于一屏幕也可滑动【特别重要】
        itemCount: dataSource.length,
        itemBuilder: (context, index) {
          if (index == dataSource.length - 1) {
            return Column(
              children: [
                ListTile(
                  title: Text("$index -- ${dataSource[index]}"),
                ),
                Divider(height: 5),
                // 显示加载更多
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.grey[400],
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: hasNext
                          ? Text(!isRequesting ? "上拉加载更多...." : "数据加载中....")
                          : InkWell(
                              child: Text("已经全部加载完毕, 点击回到顶部！"),
                              onTap: () {
                                // 如果是jumpTo(0.0); 会触发下拉刷新
                                // _scrollController.jumpTo(1.0);
                                _scrollController.animateTo(1.0,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                              },
                            ),
                    ))
                  ],
                )
              ],
            );
          } else {
            return Column(
              children: [
                ListTile(
                  title: Text("$index -- ${dataSource[index]}"),
                ),
                Divider(height: 5),
              ],
            );
          }
        },
      );

      // 主体内容
      body = RefreshIndicator(child: listView, onRefresh: _onRefresh);
    } else {
      body = Center(
        child: Text("数据加载中"),
      );
    }

    // 返回
    return body;
  }
}

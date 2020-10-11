import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/loading.dart';

class TableViewBuildTableDemo extends StatefulWidget {
  TableViewBuildTableDemo({Key key}) : super(key: key);

  @override
  _TableViewBuildTableDemoState createState() =>
      _TableViewBuildTableDemoState();
}

class _TableViewBuildTableDemoState extends State<TableViewBuildTableDemo> {
  List<int> dataSorce = [];
  bool loading = false;
  int currentPage = 0;
  bool haveNextPage = false; // 是否还有下一页
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchData(1);

    // 监听滚动事件
    _scrollController.addListener(() {
      // 判断是否有下一页
      if (haveNextPage && !loading) {
        // 有下一页，且不是在加载中
        if (_scrollController.position.pixels > 0 &&
            _scrollController.position.pixels >
                _scrollController.position.maxScrollExtent - 25) {
          // 加载数据
          if (haveNextPage && !loading) {
            // haveNextPage = false;
            fetchData(currentPage + 1);
          }
        }
      } else {
        // 没有下一页
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  fetchData(int page) {
    if (loading) {
      if (dataSorce.length > 0) {
        return;
      }
    } else {
      loading = true;
      setState(() {
        loading = true;
      });
    }
    Future.delayed(
      Duration(seconds: 1),
      () {
        if (page == 1) {
          dataSorce = [];
        }
        for (var i = 0; i < 10; i++) {
          dataSorce.add(i + page);
        }
        // 修改状态
        this.setState(() {
          dataSorce = dataSorce;
          currentPage = page;
          haveNextPage = page <= 10;
          loading = false;
        });
      },
    );
  }

  // 构建表格头部
  Widget buildTableHeaderContainer(Size size) {
    return Container(
      width: size.width,
      // 4列：
      child: Container(
        color: Colors.lightBlue[200].withOpacity(1),
        child: Wrap(
          children: [
            Container(
              width: 50,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                "ID",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
            ),
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                "名字",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
            ),
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                "年龄",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
            ),
            Container(
              width: size.width - 210,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                "描述",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView buildListViewRowsWidget(Size size) {
    return ListView.builder(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        Widget rowItemWidget = TableRowItem(size: size, i: i);
        // 判断是否下一行
        if (i == dataSorce.length - 1) {
          return Container(
            child: Column(
              children: [
                rowItemWidget,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: loading
                      ? LoadingWidget(
                          direction: Axis.horizontal,
                          imageWidth: 20,
                        )
                      : Text(
                          haveNextPage ? "上拉加载更多" : "已经加载完全部数据",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                )
              ],
            ),
          );
        } else {
          return rowItemWidget;
        }
      },
      itemCount: dataSorce.length,
    );
  }

  Future<Object> _onRefresh() async {
    fetchData(1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (dataSorce.length < 1) {
      return LoadingWidget(
        direction: Axis.horizontal,
      );
    }

    return Container(
      width: size.width,
      child: Column(
        children: [
          //  表格头部
          buildTableHeaderContainer(size),

          // 表格内容
          Expanded(
            flex: 1,
            child: Container(
              width: size.width,
              // color: Colors.lightBlue[50].withOpacity(0.6),
              child: RefreshIndicator(
                child: buildListViewRowsWidget(size),
                onRefresh: _onRefresh,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TableRowItem extends StatelessWidget {
  final int i;
  const TableRowItem({
    Key key,
    this.i = 1,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: i % 2 == 0
          ? Colors.lightBlue[50].withOpacity(0.6)
          : Colors.lightBlue[200].withOpacity(0.6),
      child: Wrap(
        children: [
          Container(
            width: 50,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              "$i",
              style: TextStyle(fontSize: 13),
              maxLines: 1,
            ),
          ),
          Container(
            width: 80,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              "名字$i",
              style: TextStyle(fontSize: 13),
              maxLines: 1,
            ),
          ),
          Container(
            width: 80,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              "${10 + i}",
              style: TextStyle(fontSize: 13),
              maxLines: 1,
            ),
          ),
          Container(
            width: size.width - 210,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              "描述内容$i",
              style: TextStyle(fontSize: 13),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}

// Grid和List混用，但是滑动的时候使用整体的滑动效果
import 'package:flutter/material.dart';

class CustomScrollViewGridListDemo extends StatefulWidget {
  CustomScrollViewGridListDemo({Key key}) : super(key: key);

  @override
  _CustomScrollViewGridListDemoState createState() =>
      _CustomScrollViewGridListDemoState();
}

class _CustomScrollViewGridListDemoState
    extends State<CustomScrollViewGridListDemo> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10),
      child: CustomScrollView(
        slivers: [
          // 上面的网格列表
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2.0, // 子控件宽高比
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  alignment: Alignment.center,
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_balance,
                          color: Colors.black54,
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            "标题：${index + 1}",
                            style:
                                TextStyle(fontSize: 13, color: Colors.black45),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 15,
            ),
          ),

          // 下面的列表1:
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Text(
                      "Title ${index + 1}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.grey[200]),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),

          // 下面的列表2:
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text(
                      "标题 ${index + 1}",
                      style: TextStyle(),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("网格和列表"),
        // brightness: Brightness.light,
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

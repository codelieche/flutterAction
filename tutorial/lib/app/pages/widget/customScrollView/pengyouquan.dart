// 实现朋友圈的滑动效果
import 'package:flutter/material.dart';

class CustomScrollViewDemoPengyouquan extends StatefulWidget {
  CustomScrollViewDemoPengyouquan({Key key}) : super(key: key);

  @override
  _CustomScrollViewDemoPengyouquanState createState() =>
      _CustomScrollViewDemoPengyouquanState();
}

class _CustomScrollViewDemoPengyouquanState
    extends State<CustomScrollViewDemoPengyouquan> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: CustomScrollView(
        slivers: [
          // 头部
          SliverAppBar(
            pinned: true,
            expandedHeight: 260,
            title: Text("朋友圈"),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                "http://static.codelieche.com/docs/images/2020/07/01114209_82.png",
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.camera),
                onPressed: () {
                  print("点击了camera");
                },
              ),
            ],
            backgroundColor: Colors.pinkAccent,
          ),

          // 下面的数据
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (content, index) {
                return ListTile(
                  title: Text("Title: $index"),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      body: body,
    );

    // 返回
    return scaffold;
  }
}

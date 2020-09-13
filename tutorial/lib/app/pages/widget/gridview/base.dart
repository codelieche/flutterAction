// GridView Base Demo Page
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:tutorial/app/components/items/container.dart';

class GridViewBaseDemoPage extends StatefulWidget {
  GridViewBaseDemoPage({Key key}) : super(key: key);

  @override
  _GridViewBaseDemoPageState createState() => _GridViewBaseDemoPageState();
}

class _GridViewBaseDemoPageState extends State<GridViewBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 先生成4个测试元素
    List<Widget> items = [
      ContainerItem(color: Colors.lightBlue, title: "第一个元素"),
      ContainerItem(color: Colors.pinkAccent, title: "第二个元素"),
      ContainerItem(color: Colors.purpleAccent, title: "第三个元素"),
    ];

    // 页面主体内容
    Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // 基本使用
        SimpleTitleWidget(
            title: "基本使用",
            description: "Flexiable包裹GridView, 或者设置shrinkWrap:true"),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            style: TextStyle(color: Colors.grey[600]),
            children: [
              TextSpan(
                text: "设置了:",
                style: TextStyle(
                    color: Colors.grey[600], fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "crossAxisCount: 3,"),
              TextSpan(text: "crossAxisSpacing: 10,"),
              TextSpan(text: "mainAxisSpacing: 1")
            ],
          ),
        ),
        // Flexible(
        //   // flex: 1,
        //   child: ,
        // ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // childAspectRatio: 2 / 1,
          children: items,
        ),

        // 设置宽高比
        SimpleTitleWidget(
            title: "设置列数", description: "childAspectRatio: 3 / 1"),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 1,
          children: items,
        ),

        // 设置spacing
        SimpleTitleWidget(
            title: "设置横向spacing", description: "crossAxisSpacing: 30,"),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 30,
          childAspectRatio: 3 / 1,
          children: items,
        ),

        // 设置spacing
        SimpleTitleWidget(
            title: "设置纵向spacing", description: "mainAxisSpacing: 30,"),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 3 / 1,
          children: items,
        ),

        // 设置列数
        SimpleTitleWidget(title: "设置列数", description: "crossAxisCount: 2"),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 1,
          children: items,
        ),
      ],
    );
    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}

// Stack基本使用示例
import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:tutorial/app/components/items/container.dart';

class StackBaseDemoPage extends StatefulWidget {
  StackBaseDemoPage({Key key}) : super(key: key);

  @override
  _StackBaseDemoPageState createState() => _StackBaseDemoPageState();
}

class _StackBaseDemoPageState extends State<StackBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 先准备3个容器元素
    List<Widget> items = [
      // 第1个容器: 底层的容器: 200 x 200
      ContainerItem(
        width: 200,
        height: 200,
        color: AppPrimaryColor,
      ),

      // 第2个容器：150 x 90
      ContainerItem(
        width: 150,
        height: 90,
        color: Colors.pinkAccent,
      ),

      // 第3个容器：100 x 35
      ContainerItem(
        width: 100,
        height: 35,
        color: Colors.greenAccent,
      )
    ];

    // 页面的主体内容
    Widget body = Column(
      children: [
        // 三个组件叠加

        // 默认：topStart
        SimpleTitleWidget(
          title: "默认: topStart",
          description:
              "alignment: AlignmentDirectional.topStart | Alignment(-1, -1)",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          alignment: AlignmentDirectional.topStart,
          // alignment: Alignment(-1, -1),
          children: items,
        ),

        // 顶部居中：topCenter
        SimpleTitleWidget(
          title: "topCenter",
          description:
              "alignment: AlignmentDirectional.topCenter | Alignment(0, -1)",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          // alignment: AlignmentDirectional.topCenter,
          alignment: Alignment(0, -1),
          children: items,
        ),

        // topEnd
        SimpleTitleWidget(
          title: "topEnd",
          description:
              "alignment: AlignmentDirectional.topEnd | Alignment(1, -1)",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          // alignment: AlignmentDirectional.topEnd,
          alignment: Alignment(1, -1),
          children: items,
        ),

        // centerStart
        SimpleTitleWidget(
          title: "centerStart",
          description: "alignment: AlignmentDirectional.centerStart",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          alignment: AlignmentDirectional.centerStart,
          children: items,
        ),

        // center
        SimpleTitleWidget(
          title: "center",
          description: "alignment: AlignmentDirectional.center",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          alignment: AlignmentDirectional.center,
          children: items,
        ),

        // centerEnd
        SimpleTitleWidget(
          title: "centerEnd",
          description: "alignment: AlignmentDirectional.centerEnd",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          alignment: AlignmentDirectional.centerEnd,
          children: items,
        ),

        // bottomStart
        SimpleTitleWidget(
          title: "bottomStart",
          description: "alignment: AlignmentDirectional.bottomStart",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          alignment: AlignmentDirectional.bottomStart,
          children: items,
        ),

        // bottomCenter
        SimpleTitleWidget(
          title: "bottomCenter",
          description: "alignment: AlignmentDirectional.bottomCenter",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          alignment: AlignmentDirectional.bottomCenter,
          children: items,
        ),

        // bottomEnd
        SimpleTitleWidget(
          title: "bottomEnd",
          description: "alignment: AlignmentDirectional.bottomEnd",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          alignment: AlignmentDirectional.bottomEnd,
          children: items,
        ),

        // Alignment(0, 0.5)
        SimpleTitleWidget(
          title: "Alignment(0, 0.5)",
          description: "alignment: Alignment(0, 0.5)",
        ),
        Stack(
          // alignment配置所有子元素的显示位置
          alignment: Alignment(0, 0.5),
          children: items,
        ),
      ],
    );
    return SingleChildScrollView(
      child: body,
    );
  }
}

// Stack结合align使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:tutorial/app/components/items/container.dart';

class StackAComplexlignDemoPage extends StatefulWidget {
  StackAComplexlignDemoPage({Key key}) : super(key: key);

  @override
  _StackAComplexlignDemoPage createState() => _StackAComplexlignDemoPage();
}

class _StackAComplexlignDemoPage extends State<StackAComplexlignDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 先准备3个容器元素
    List<Widget> items = [
      // 第1个容器: 底层的容器: 200 x 200
      ContainerItem(
        width: 200,
        height: 200,
        color: Colors.lightBlue,
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

    // 页面主体内容
    Widget body = Column(
      children: [
        // 默认三个容器
        SimpleTitleWidget(
          title: "默认",
          description: "Stack children直接使用三个容器",
        ),
        Stack(
          children: items,
        ),

        // 结合Align使用
        SimpleTitleWidget(
          title: "结合Align",
          description: "Stack children使用三个Align组件, Stack的子组件会相对Stack的父组件进行定位。",
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.grey[400],
          child: Stack(
            children: [
              // 底部居右
              Align(
                alignment: Alignment.bottomRight,
                child: items[0],
              ),
              // 居中靠左
              Align(
                alignment: Alignment.centerLeft,
                child: items[1],
              ),
              // 顶部居右
              Align(
                alignment: Alignment.topRight,
                child: items[2],
              )
            ],
          ),
        ),

        // 结合Positioned使用
        SimpleTitleWidget(
          title: "结合Positioned",
          description:
              "Stack children使用三个Positioned组件, Stack的子组件会相对Stack的父组件进行定位。",
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.yellow[400],
          child: Stack(
            children: [
              // 距离顶部80，右侧20
              Positioned(
                top: 80,
                right: 20,
                child: items[0],
              ),
              // 距离顶部100，左侧50
              Positioned(
                top: 100,
                left: 50,
                child: items[1],
              ),
              // 顶部0，右侧50
              Positioned(
                top: 0,
                right: 50,
                child: items[2],
              )
            ],
          ),
        ),
      ],
    );

    return SingleChildScrollView(
      child: body,
    );
  }
}

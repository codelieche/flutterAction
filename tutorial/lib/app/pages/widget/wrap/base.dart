// Wrap基本使用示例
import 'package:flutter/material.dart';
// import 'package:tutorial/app/variables.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:tutorial/app/components/items/container.dart';

//  引入基础组件
// import 'items.dart';

class WrapBaseDemoPage extends StatefulWidget {
  WrapBaseDemoPage({Key key}) : super(key: key);

  @override
  _WrapBaseDemoPageState createState() => _WrapBaseDemoPageState();
}

class _WrapBaseDemoPageState extends State<WrapBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 示例
    List<Widget> items = [
      ContainerItem(width: 50, height: 80, color: Colors.grey[400]),
      ContainerItem(width: 100, height: 60, color: Colors.blue[200]),
      ContainerItem(width: 40, height: 30, color: Colors.red[300]),
      ContainerItem(width: 80, height: 50),
      ContainerItem(width: 80, height: 50, color: Colors.pink[300]),
    ];

    // 主体内容
    var body = Column(
      children: [
        // 基本使用
        SimpleTitleWidget(
          title: "默认",
          description:
              "默认：direction: Axis.horizontal;  crossAxisAlignment: WrapCrossAlignment.start",
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: items,
        ),

        // 纵向居中对齐
        SimpleTitleWidget(
          title: "crossAxisAlignment【center】",
          description: "crossAxisAlignment: WrapCrossAlignment.center",
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: items,
        ),

        // 纵向底部对齐
        SimpleTitleWidget(
          title: "crossAxisAlignment【end】",
          description: "crossAxisAlignment: WrapCrossAlignment.end",
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: items,
        ),

        // 设置间隔
        SimpleTitleWidget(
          title: "设置间隔",
          description: "spacing: 10",
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.end,
          spacing: 10,
          children: items,
        ),

        // 设置间隔
        SimpleTitleWidget(
          title: "纵向排列",
          description: "direction: Axis.vertical",
        ),
        Container(
          width: 350,
          height: 230,
          color: Colors.cyanAccent[400],
          child: Wrap(
            direction: Axis.vertical,
            // crossAxisAlignment: WrapCrossAlignment.end,
            spacing: 10,
            children: items,
          ),
        )
      ],
    );
    return SingleChildScrollView(
      child: body,
    );
  }
}

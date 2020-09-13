// GridView结合Flexible使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/container.dart';
import 'package:tutorial/app/components/items/title.dart';

class GridViewFlexibleDemoPage extends StatefulWidget {
  GridViewFlexibleDemoPage({Key key}) : super(key: key);

  @override
  _GridViewFlexibleDemoPageState createState() =>
      _GridViewFlexibleDemoPageState();
}

class _GridViewFlexibleDemoPageState extends State<GridViewFlexibleDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 构建20个容器
    List<Widget> items = [];
    List.generate(
        20,
        (index) => items
          ..add(ContainerItem(
            margin: 0.0,
            title: "Item${index + 1}",
          )));

    // 页面主体内容
    Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SimpleTitleWidget(title: "示例区域1", description: "flex: 2"),
        Flexible(
          flex: 2,
          child: GridView.count(
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            crossAxisCount: 3,
            children: [...items],
          ),
        ),
        SimpleTitleWidget(title: "示例区域2", description: "flex: 1"),
        Flexible(
          flex: 1,
          child: GridView.count(
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 4,
            childAspectRatio: 2 / 1,
            children: [...items],
          ),
        )
      ],
    );

    // 返回: 用了Flexible就不要外面包裹ScrollView了，否则报错
    return body;

    // return SingleChildScrollView(
    //   child: body,
    // );
  }
}

/**
 * 容器相关的组件示例
 * 路由：/widget/container/index
 */
import 'package:flutter/material.dart';

// 设置width、height、color
import 'widthHeightColor.dart';
// Container的child相对Container的对齐方式：alignment
import 'alignment.dart';
// padding and margin
import 'paddingMargin.dart';
// decoration
import 'decoration.dart';
// constraints
import 'constraints.dart';

class ContainerWidgetIndexPage extends StatefulWidget {
  @override
  _ContainerWidgetIndexPageState createState() =>
      _ContainerWidgetIndexPageState();
}

class _ContainerWidgetIndexPageState extends State<ContainerWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("设置宽/高/颜色"),
          onTap: () {
            // print("设置wide/height/color");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return ContainerWidthHeightColorDemo();
            }));
          },
        ),
        Divider(),
        ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("alignment: 对其方式"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ContainerAlignmentDemo();
              }));
            }),
        Divider(),
        ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("padding and margin: 填充与边距"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ContainerPaddingMarginDemo();
              }));
            }),
        Divider(),
        ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("decoration: 装饰"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ContainerDecorationDemo();
              }));
            }),
        Divider(),
        ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("constraints: 限制"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ContainerConstraintsDemoPage();
              }));
            }),
        Divider(),
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: body,
    );

    return scaffold;
  }
}

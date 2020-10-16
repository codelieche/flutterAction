// TextField Demo
import 'package:flutter/material.dart';

// TextField相关示例
import 'base.dart';
import 'color.dart';
import 'keyboard.dart';
import 'decoration.dart';
import 'border.dart';
import 'controller.dart';

class TextFieldIndexDemoPage extends StatefulWidget {
  TextFieldIndexDemoPage({Key key}) : super(key: key);

  @override
  _TextFieldIndexDemoPageState createState() => _TextFieldIndexDemoPageState();
}

class _TextFieldIndexDemoPageState extends State<TextFieldIndexDemoPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: [
          // 示例1：基本使用
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              // 跳转示例1：TextField的基本使用
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TextFieldBaseDemoPage();
              }));
            },
            title: Text("基本使用"),
          ),
          Divider(height: 5),

          // 示例2：颜色配置
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              // 跳转示例1：TextField的颜色配置
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TextFieldColorDemoPage();
              }));
            },
            title: Text("配置颜色"),
          ),
          Divider(height: 5),

          // 示例3：键盘类型
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              // 跳转示例3：TextField的键盘类型
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TextFieldKeyBoardTypeDemoPage();
              }));
            },
            title: Text("keyboardType"),
          ),
          Divider(height: 5),

          // 示例4：基本装饰: Decoration
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              // 跳转示例1：TextField的基本装饰
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TextFieldDecorationDemoPage();
              }));
            },
            title: Text("装饰:Decoration"),
          ),
          Divider(height: 5),

          // 示例5：基本装饰: border
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              // 跳转示例1：TextField的基本装饰 border
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TextFieldBorderDemoPage();
              }));
            },
            title: Text("边框：board"),
          ),
          Divider(height: 5),

          // 示例6：文本控制器
          ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: () {
              // 跳转示例1：TextField的控制器
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return TextFieldControllerDemoPage();
              }));
            },
            title: Text("控制器：controller"),
          ),
          Divider(height: 5),
        ],
      ),
    );

    body = SingleChildScrollView(
      child: body,
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

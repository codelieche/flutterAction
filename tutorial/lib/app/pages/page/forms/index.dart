// Form相关
import 'package:flutter/material.dart';

// 引入示例
import 'text/index.dart';
import 'select/index.dart';
import 'info/index.dart';

class PageFormsDemoIndexPage extends StatefulWidget {
  PageFormsDemoIndexPage({Key key}) : super(key: key);

  @override
  _PageFormsDemoIndexPageState createState() => _PageFormsDemoIndexPageState();
}

class _PageFormsDemoIndexPageState extends State<PageFormsDemoIndexPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: ListView(
        children: [
          // 1. TextField
          ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("text: 文本值"),
            onTap: () {
              // 跳转选择的实例
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PageFormsTextDemoIndexPage();
              }));
            },
          ),
          Divider(height: 4),

          // 2. SelectValues
          ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("Select: 选择值【单选、多选】"),
            onTap: () {
              // 跳转选择的实例
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PageFormsSelectIndexPage();
              }));
            },
          ),
          Divider(height: 4),

          // 3. info展示
          ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text("Info: 信息的展示"),
            onTap: () {
              // 跳转选择的实例
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PageFormsInfoDemoIndexPage();
              }));
            },
          ),
          Divider(height: 4),
        ],
      ),
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("表单"),
      ),
      body: body,
    );

    // 返回
    return scaffold;
  }
}

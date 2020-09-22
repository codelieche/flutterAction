// Demo Index Page
import 'package:flutter/material.dart';

// 练习页面
import 'lianxi/lianxi001.dart';

class DemoIndexPage extends StatefulWidget {
  DemoIndexPage({Key key}) : super(key: key);

  @override
  _DemoIndexPageState createState() => _DemoIndexPageState();
}

class _DemoIndexPageState extends State<DemoIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        // 练习页
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("练习001"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Lianxi001DemoPage();
                },
              ),
            );
          },
        )
      ],
    );

    // 返回
    return body;
  }
}

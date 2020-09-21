// Loading Widget
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

// 引入示例
// import 'progressIndicator.dart';
import 'base.dart';

class LoadingDemoIndexPage extends StatefulWidget {
  LoadingDemoIndexPage({Key key}) : super(key: key);

  @override
  _LoadingDemoIndexPageState createState() => _LoadingDemoIndexPageState();
}

class _LoadingDemoIndexPageState extends State<LoadingDemoIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = ListView(
      children: [
        // // 进度指示器
        // SimpleTitleWidget(title: "进度指示器"),
        // ProgressIndicatorDemoPage(),

        // Loading基本使用
        SimpleTitleWidget(
          title: "基本示例",
          description: "CircularProgressIndicator",
        ),
        LoadingBaseDemo(),
      ],
    );

    // 返回
    return body;
  }
}

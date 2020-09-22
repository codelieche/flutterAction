// 进度条
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ProgressIndicatorDemoPage extends StatefulWidget {
  ProgressIndicatorDemoPage({Key key}) : super(key: key);

  @override
  _ProgressIndicatorDemoPageState createState() =>
      _ProgressIndicatorDemoPageState();
}

class _ProgressIndicatorDemoPageState extends State<ProgressIndicatorDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(
          title: "LinearProgressIndicator",
          description: "LinearProgressIndicator()",
        ),
        LinearProgressIndicator(),
        SimpleTitleWidget(
          title: "设置值",
          description: "value: 0.5(0.0-1.0)",
        ),
        LinearProgressIndicator(value: 0.5),
        SimpleTitleWidget(
          title: "设置backgroundColor",
          description: "backgroundColor: Colors.pinkAccent",
        ),
        LinearProgressIndicator(
          value: 0.6,
          backgroundColor: Colors.pinkAccent,
        ),
        SimpleTitleWidget(
          title: "设置valueColor",
          description: "backgroundColor: Colors.pinkAccent",
        ),
        LinearProgressIndicator(
          value: 0.6,
          backgroundColor: Colors.pinkAccent,
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),

        // 间距
        Divider(
          height: 50,
          thickness: 1.0,
        ),

        // 圆形进度条
        SimpleTitleWidget(
          title: "CircularProgressIndicator",
          description: "CircularProgressIndicator()",
        ),
        CircularProgressIndicator(),
        SimpleTitleWidget(
          title: "设置值",
          description: "value: 0.5(0.0-1.0)",
        ),
        CircularProgressIndicator(value: 0.5),
        SimpleTitleWidget(
          title: "设置backgroundColor",
          description: "backgroundColor: Colors.pinkAccent",
        ),
        CircularProgressIndicator(
          value: 0.6,
          backgroundColor: Colors.pinkAccent,
        ),
        SimpleTitleWidget(
          title: "设置valueColor",
          description: "backgroundColor: Colors.pinkAccent",
        ),
        CircularProgressIndicator(
          value: 0.6,
          backgroundColor: Colors.pinkAccent,
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("进度条"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );

    // 返回
    return scaffold;
  }
}

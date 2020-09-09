// AspectRatio: 屏幕宽高比
// AspectRatio的作用是，根据设置调整子元素child的宽高比。
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class AspectRatioDemoPage extends StatefulWidget {
  AspectRatioDemoPage({Key key}) : super(key: key);

  @override
  _AspectRatioDemoPageState createState() => _AspectRatioDemoPageState();
}

class _AspectRatioDemoPageState extends State<AspectRatioDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 屏幕主体内容
    Widget body = Column(
      children: [
        // 设置宽高比：1.0/0.5
        SimpleTitleWidget(
          title: "宽高比：1.0/0.5",
        ),
        AspectRatio(
          aspectRatio: 1.0 / 0.5,
          child: Container(
            color: Colors.lightBlue,
          ),
        ),

        // 设置宽高比：1.0/0.2
        SimpleTitleWidget(
          title: "宽高比：1.0/0.2",
        ),
        AspectRatio(
          aspectRatio: 1.0 / 0.5,
          child: Container(
            color: Colors.pinkAccent,
          ),
        ),

        // 设置宽高比：1.0/0.2
        SimpleTitleWidget(
          title: "指定宽的值",
          description: "设定父级元素的宽，然后设定子元素的宽高比：1.0/0.2",
        ),
        Container(
          color: Colors.green,
          width: 200,
          child: AspectRatio(
            aspectRatio: 1.0 / 0.5,
            child: Container(
              color: Colors.deepOrange,
            ),
          ),
        )
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("AspectRatio"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    return scaffold;
  }
}

// 文本输入框装饰
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class TextFieldColorDemoPage extends StatefulWidget {
  TextFieldColorDemoPage({Key key}) : super(key: key);

  @override
  _TextFieldColorDemoPageState createState() => _TextFieldColorDemoPageState();
}

class _TextFieldColorDemoPageState extends State<TextFieldColorDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 基本装饰:包裹一层Container
        SimpleTitleWidget(
            title: "外面包裹一层Container", description: "配置container的color"),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.yellow[200],
            child: TextField(),
          ),
        ),

        // 基本装饰：设置字体颜色
        SimpleTitleWidget(title: "设置字体颜色", description: "style: TextStyle"),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.lightBlue[100],
            child: TextField(
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // 基本装饰：键盘颜色
        SimpleTitleWidget(
            title: "键盘颜色",
            description: "keyboardAppearance: Brightness.light(iOS默认是dark)"),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.grey[100],
            child: TextField(
              decoration: InputDecoration(hintText: "Brightness.light"),
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
              ),
              keyboardAppearance: Brightness.light,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.grey[100],
            child: TextField(
              decoration: InputDecoration(hintText: "Brightness.dark"),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              keyboardAppearance: Brightness.dark,
              keyboardType: TextInputType.phone,
            ),
          ),
        )
      ],
    );
    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("TextField颜色配置"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    return scaffold;
  }
}

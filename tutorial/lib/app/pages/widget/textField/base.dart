// TextField的基本使用
// autocorrect: 是否自动校正（默认true）
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class TextFieldBaseDemoPage extends StatefulWidget {
  TextFieldBaseDemoPage({Key key}) : super(key: key);

  @override
  _TextFieldBaseDemoPageState createState() => _TextFieldBaseDemoPageState();
}

class _TextFieldBaseDemoPageState extends State<TextFieldBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 基本使用
        SimpleTitleWidget(
          title: "基本使用",
          description: "使用默认的配置",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(),
        ),

        // 自动校正
        SimpleTitleWidget(
          title: "自动校正",
          description: "autocorrect: false/true(默认)",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(autocorrect: false),
        ),

        // 设置最大行数
        SimpleTitleWidget(
          title: "设置最大行数",
          description: "maxLines: 1(默认)/int类型",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(maxLines: 5),
        ),

        // 设置最大长度
        SimpleTitleWidget(
          title: "设置字符最大长度",
          description: "maxLength: 20(示例)",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(maxLength: 20),
        ),

        // 设置最大长度
        SimpleTitleWidget(
          title: "执行字符最大长度限制",
          description: "maxLength: 10(示例); maxLengthEnforced: false/true(默认)",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            maxLength: 10,
            maxLengthEnforced: false,
          ),
        ),

        // 自动获取焦点
        SimpleTitleWidget(
          title: "自动获取焦点",
          description: "autofocus: false(默认)/true",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(autofocus: false),
        ),

        // 是否启用
        SimpleTitleWidget(
          title: "是否启用",
          description: "enabled: false/true(默认)",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(enabled: false),
        ),

        // 隐藏输入的内容
        SimpleTitleWidget(
          title: "隐藏输入的内容",
          description: "obscureText: false(默认)/true(用点隐藏了字符)",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(obscureText: true),
        ),

        // 文字变更：onChange
        SimpleTitleWidget(
          title: "输入的字符变更",
          description: "onChanged: Void Function(String)",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(onChanged: (value) {
            print("当前输入的内容是：$value");
          }),
        ),

        // 文本提交：onSubmitted
        SimpleTitleWidget(
          title: "提交事件",
          description: "onSubmitted: Void Function(String)",
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
            onSubmitted: (value) {
              String msg = "文本提交：$value";
              // Scaffold.of(context).showSnackBar(SnackBar(
              //   content: Container(
              //     color: Colors.red,
              //     child: Text(msg),
              //   ),
              //   duration: Duration(seconds: 2),
              // ));
              print(msg);

              // 显示弹出消息框
              showDialog(
                context: context,
                child: AlertDialog(
                  content: Text(msg),
                ),
              );
            },
          ),
        )
      ],
    );

    // 脚手架
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );

    // 返回
    return scaffold;
  }
}

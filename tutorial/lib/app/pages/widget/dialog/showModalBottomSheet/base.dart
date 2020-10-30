// showModalBottomSheet Base Demo
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ShowModalBottomSheetBaseDemo extends StatefulWidget {
  ShowModalBottomSheetBaseDemo({Key key}) : super(key: key);

  @override
  _ShowModalBottomSheetBaseDemoState createState() =>
      _ShowModalBottomSheetBaseDemoState();
}

class _ShowModalBottomSheetBaseDemoState
    extends State<ShowModalBottomSheetBaseDemo> {
  String name;
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(title: "基本使用", description: "showModalBottomSheet"),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            // 弹出文本消息
            RaisedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        alignment: Alignment.center,
                        height: 60,
                        color: Colors.grey[50],
                        child: Text("你好啊！底部消息"),
                      );
                    });
              },
              child: Text("弹出Text"),
            ),

            // 弹出CheckBox消息
            RaisedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.grey[50],
                        child: _CheckBoxContent(),
                      );
                    });
              },
              child: Text("弹出CheckBox"),
            ),

            // 弹出图片消息
            RaisedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 100,
                        padding: EdgeInsets.all(10),
                        color: Colors.grey[50],
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(),
                              Container(
                                height: 50,
                                child: Image.asset(
                                    "assets/images/codelieche-blue.png"),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 50,
                                child: Image.asset(
                                    "assets/images/codelieche-logo-blue.png"),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text("弹出Image"),
            ),
          ],
        )
      ],
    );

    // 返回
    return body;
  }
}

// 对话框中使用checkbox
class _CheckBoxContent extends StatefulWidget {
  _CheckBoxContent({Key key}) : super(key: key);

  @override
  _CheckBoxContentState createState() => _CheckBoxContentState();
}

class _CheckBoxContentState extends State<_CheckBoxContent> {
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Column(
        children: [
          CheckboxListTile(
            title: Text("codelieche"),
            value: this.name == "codelieche",
            onChanged: (checked) {
              if (checked) {
                setState(() {
                  name = "codelieche";
                });
              }
            },
          ),
          CheckboxListTile(
            title: Text("编程列车"),
            value: this.name == "编程列车",
            onChanged: (checked) {
              if (checked) {
                setState(() {
                  name = "编程列车";
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

// 表单组件
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class FormWidgetIndexPage extends StatefulWidget {
  FormWidgetIndexPage({Key key}) : super(key: key);

  @override
  _FormWidgetIndexPageState createState() => _FormWidgetIndexPageState();
}

class _FormWidgetIndexPageState extends State<FormWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 表单组件
    Widget body = ListView(
      children: [
        // TextFields相关的示例
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("TextField"),
          onTap: () {
            Navigator.pushNamed(context, "/widget/textfield/index");
          },
        ),
        Divider(height: 3),

        // Radio
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("Radio"),
          onTap: () {
            Navigator.pushNamed(context, "/widget/radio/index");
          },
        ),
        Divider(height: 3),

        // CheckBox相关的组件
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("CheckBox"),
          onTap: () {
            Navigator.pushNamed(context, "/widget/checkbox/index");
          },
        ),
        Divider(height: 3),

        // 消息/警告
        SimpleTitleWidget(title: "消息/警告"),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            // 测试消息
            RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("测试弹出底部消息的内容"),
                  duration: Duration(seconds: 2),
                ));
              },
              child: Text("底部消息"),
            ),
            SizedBox(width: 10),
          ],
        )
      ],
    );

    // 返回
    return body;
  }
}

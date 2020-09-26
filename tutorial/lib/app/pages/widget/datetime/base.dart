// 时间日期的基本使用
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class DateTimeBaseDemoPage extends StatefulWidget {
  DateTimeBaseDemoPage({Key key}) : super(key: key);

  @override
  _DateTimeBaseDemoPageState createState() => _DateTimeBaseDemoPageState();
}

class _DateTimeBaseDemoPageState extends State<DateTimeBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 页面主体内容
    Widget body = ListView(
      children: [
        SimpleTitleWidget(
          title: "显示日期",
          description: "showDatePicker",
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: RaisedButton(
                  onPressed: () async {
                    var result = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), // 初始化时间
                      firstDate: DateTime(1990, 1, 1), // 选择开始日期
                      lastDate: DateTime(2100, 12, 31), // 选择结束日期
                    );
                    print('$result');
                  },
                  child: Text("弹出选择日期"),
                ),
              ),
            )
          ],
        )
      ],
    );
    return body;
  }
}

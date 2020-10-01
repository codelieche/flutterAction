// 时间日期的基本使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class DateTimeBaseDemoPage extends StatefulWidget {
  DateTimeBaseDemoPage({Key key}) : super(key: key);

  @override
  _DateTimeBaseDemoPageState createState() => _DateTimeBaseDemoPageState();
}

class _DateTimeBaseDemoPageState extends State<DateTimeBaseDemoPage> {
  DateTime startDateTime; // 开始的日期
  DateTime endDateTime; // 结束的时间日期

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
                padding: EdgeInsets.all(10),
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
                  child: Text("选择日期(en)"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: () async {
                    var result = await showDatePicker(
                      locale: Locale('zh'),
                      context: context,
                      initialDate: DateTime.now(), // 初始化时间
                      firstDate: DateTime(1990, 1, 1), // 选择开始日期
                      lastDate: DateTime(2100, 12, 31), // 选择结束日期
                    );
                    print('$result');
                  },
                  child: Text("选择日期(中文)"),
                ),
              ),
            )
          ],
        ),

        // 显示时间
        SimpleTitleWidget(
          title: "显示时间",
          description: "showTimePicker",
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () async {
                    var result = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(), // 初始化时间
                    );
                    print('$result');
                  },
                  child: Text("选择时间(en)"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: () async {
                    var result = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(), // 初始化时间
                        builder: (context, child) {
                          return Localizations(
                            locale: const Locale('zh'),
                            child: child,
                            delegates: <LocalizationsDelegate>[
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                            ],
                          );
                        });
                    print('$result');
                  },
                  child: Text("选择时间(中文)"),
                ),
              ),
            )
          ],
        ),

        // iOS风格
        SimpleTitleWidget(
          title: "iOS风格日期时间选择",
          description: "CupertinoDatePicker",
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                // padding: EdgeInsets.all(10),
                // 配置了本地化，记得设置GlobalCupertinoLocalizations.delegate,
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  onDateTimeChanged: (date) {
                    print(date);
                  },
                  initialDateTime: DateTime.now(),
                ),
              ),
            ),
          ],
        ),

        // 显示时间
        SimpleTitleWidget(
          title: "日期区间",
          description: "date_range_picker(第三方库)",
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          color: Colors.grey[200],
          child: Text(
            "选择的区间：\n${startDateTime != null ? DateFormat("yyyy-MM-dd").format(startDateTime) : ""} -- ${endDateTime != null ? DateFormat("yyyy-MM-dd").format(endDateTime) : ""}",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () async {
                    final List<DateTime> picked =
                        await DateRagePicker.showDatePicker(
                            context: context,
                            initialFirstDate: startDateTime != null
                                ? startDateTime
                                : new DateTime.now(),
                            initialLastDate: endDateTime != null
                                ? endDateTime
                                : (new DateTime.now())
                                    .add(new Duration(days: 7)),
                            firstDate: new DateTime(2013),
                            lastDate: new DateTime(2100));
                    if (picked != null && picked.length == 2) {
                      print(picked);
                      setState(() {
                        startDateTime = picked[0];
                        endDateTime = picked[1];
                      });
                    }
                  },
                  child: Text("选择区间(en)"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: () async {
                    final List<DateTime> picked =
                        await DateRagePicker.showDatePicker(
                            locale: Locale("zh"),
                            context: context,
                            initialFirstDate: startDateTime != null
                                ? startDateTime
                                : new DateTime.now(),
                            initialLastDate: endDateTime != null
                                ? endDateTime
                                : (new DateTime.now())
                                    .add(new Duration(days: 7)),
                            firstDate: new DateTime(2013),
                            lastDate: new DateTime(2100));
                    if (picked != null && picked.length == 2) {
                      print(picked);
                      setState(() {
                        startDateTime = picked[0];
                        endDateTime = picked[1];
                      });
                    }
                  },
                  child: Text("选择区间(中文)"),
                ),
              ),
            )
          ],
        ),
      ],
    );
    return body;
  }
}

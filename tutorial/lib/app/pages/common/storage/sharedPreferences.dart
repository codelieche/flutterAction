// shared_preferences 基本使用
// https://pub.flutter-io.cn/packages/shared_preferences
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/app/components/items/title.dart';

class SharedPreferencesBaseDemoPage extends StatefulWidget {
  SharedPreferencesBaseDemoPage({Key key}) : super(key: key);

  @override
  _SharedPreferencesBaseDemoPageState createState() =>
      _SharedPreferencesBaseDemoPageState();
}

class _SharedPreferencesBaseDemoPageState
    extends State<SharedPreferencesBaseDemoPage> {
  // 类型
  String valueType = "String";
  // 编辑控制器
  TextEditingController _keyInputController =
      TextEditingController(text: "key");
  TextEditingController _valueInputController =
      TextEditingController(text: "value");
  // SharedPreferences实例
  // SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _keyInputController.dispose();
    _valueInputController.dispose();
    super.dispose();
  }

  // 设置值
  saveKeyValue() async {
    // 先实例化SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 得到数据key, value, valueType
    String key = _keyInputController.text;
    String value = _valueInputController.text;

    // 开始保存
    if (valueType == "String") {
      bool result = await prefs.setString(key, value);
      if (result) {
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.lightBlue,
          content: Text("设置$key为$value: 成功！"),
        ));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.pinkAccent,
          content: Text("设置$key为$value: 失败！！！"),
        ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("本示例暂时不支持非字符类型"),
            );
          });
    }
  }

  // 获取值
  getKeyValue() async {
    // 先实例化SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 得到数据key, value, valueType
    String key = _keyInputController.text;
    String value;

    // 开始保存
    if (valueType == "String") {
      value = prefs.getString(key);
      // print(value);
      // _valueInputController.text = "$key的值是: $value";
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.lightBlue,
        content: Text("获取成功： $key   :   $value"),
      ));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("本示例暂时不支持非字符类型"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(
          title: "Key/Value",
          description: "SharedPreferences",
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  // 第一行：key值
                  Row(
                    children: [
                      Container(
                        width: 80,
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Key:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _keyInputController,
                        ),
                      )
                    ],
                  ),

                  // 第二行：类型
                  Row(
                    children: [
                      Container(
                        width: 80,
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "类型:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DropdownButton(
                        value: this.valueType,
                        isExpanded: false,
                        items: [
                          DropdownMenuItem(
                            child: Text("String"),
                            value: "String",
                          ),
                          DropdownMenuItem(
                            child: Text("Int"),
                            value: "Int",
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            valueType = value;
                          });
                        },
                      )
                    ],
                  ),

                  // 第三行：Value
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        padding: EdgeInsets.only(left: 5, top: 10),
                        child: Text(
                          "Value:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            minLines: 2,
                            maxLines: 5,
                            controller: _valueInputController,
                          ),
                        ),
                      )
                    ],
                  ),

                  // 按钮
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: RaisedButton(
                            color: Colors.lightBlue,
                            textColor: Colors.white,
                            onPressed: this.saveKeyValue,
                            child: Text("设置"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: RaisedButton(
                            color: Colors.pinkAccent,
                            textColor: Colors.white,
                            onPressed: this.getKeyValue,
                            child: Text("获取"),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );

    // 返回
    return SingleChildScrollView(
      child: body,
    );
  }
}

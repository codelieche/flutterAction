// 表单组件
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';
import 'package:tutorial/app/pages/widget/textField/color.dart';

// TextField相关的示例
import 'textField/base.dart';
import 'textField/color.dart';
import 'textField/keyboard.dart';
import 'textField/decoration.dart';
import 'textField/border.dart';
import 'textField/controller.dart';

// raido相关的示例
import 'radio/base.dart';
import 'radio/radioListTile.dart';

// CheckBox相关的组件
import 'checkbox/base.dart';
import 'checkbox/checkboxListTile.dart';

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
        SimpleTitleWidget(
          title: "TextField",
          description: "TextField的基本使用",
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            // 示例1：基本使用
            RaisedButton(
              onPressed: () {
                // 跳转示例1：TextField的基本使用
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return TextFieldBaseDemoPage();
                }));
              },
              child: Text("基本使用"),
            ),
            SizedBox(width: 10),

            // 示例2：颜色配置
            RaisedButton(
              onPressed: () {
                // 跳转示例1：TextField的颜色配置
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return TextFieldColorDemoPage();
                }));
              },
              child: Text("配置颜色"),
            ),
            SizedBox(width: 10),

            // 示例3：键盘类型
            RaisedButton(
              onPressed: () {
                // 跳转示例3：TextField的键盘类型
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return TextFieldKeyBoardTypeDemoPage();
                }));
              },
              child: Text("keyboardType"),
            ),
            SizedBox(width: 10),

            // 示例4：基本装饰: Decoration
            RaisedButton(
              onPressed: () {
                // 跳转示例1：TextField的基本装饰
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return TextFieldDecorationDemoPage();
                }));
              },
              child: Text("装饰:Decoration"),
            ),
            SizedBox(width: 10),

            // 示例5：基本装饰: border
            RaisedButton(
              onPressed: () {
                // 跳转示例1：TextField的基本装饰 border
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return TextFieldBorderDemoPage();
                }));
              },
              child: Text("边框：board"),
            ),
            SizedBox(width: 10),

            // 示例6：文本控制器
            RaisedButton(
              onPressed: () {
                // 跳转示例1：TextField的控制器
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return TextFieldControllerDemoPage();
                }));
              },
              child: Text("控制器：controller"),
            ),
            SizedBox(width: 10),
          ],
        ),

        // Radio
        SimpleTitleWidget(title: "Radio"),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            // 示例1：raido的基本使用
            RaisedButton(
              onPressed: () {
                // 跳转:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RadioBaseDemoPage();
                }));
              },
              child: Text("基本使用"),
            ),

            SizedBox(width: 10),

            // 示例2：RaidoListTile的基本使用
            RaisedButton(
              onPressed: () {
                // 跳转:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RadioListTileBaseDemoPage();
                }));
              },
              child: Text("RaidoListTile"),
            )
          ],
        ),

        // CheckBox相关的组件
        SimpleTitleWidget(title: "CheckBox"),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return CheckBoxBaseDemoPage();
                }));
              },
              child: Text("基本使用"),
            ),
            SizedBox(width: 10),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return CheckBoxListTileBaseDemoPage();
                }));
              },
              child: Text("CheckboxListTile"),
            )
          ],
        ),

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

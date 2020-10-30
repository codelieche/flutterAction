// 凸起按钮
// 其实就是Material Design风格的按钮
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class RaisedButtonDemoPage extends StatefulWidget {
  RaisedButtonDemoPage({Key key}) : super(key: key);

  @override
  _RaisedButtonDemoPageState createState() => _RaisedButtonDemoPageState();
}

class _RaisedButtonDemoPageState extends State<RaisedButtonDemoPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(
          title: "凸起按钮: 基本使用",
          description: "RaisedButton: Material Design 风格的按钮",
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            RaisedButton(
              onPressed: () {},
              child: Text("普通按钮"),
            ),
            SizedBox(width: 10), // 加个间隙
            RaisedButton(
              onPressed: () {},
              child: Text("文本颜色"),
              textColor: Colors.pinkAccent,
            ),
            SizedBox(width: 10), // 加个间隙
            RaisedButton(
              onPressed: () {},
              child: Text("按钮颜色"),
              textColor: Colors.white,
              color: Colors.lightBlue,
            ),
            SizedBox(width: 10), // 加个间隙
            RaisedButton(
              onPressed: null,
              child: Text("禁用时候的颜色"),
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
            ),
            SizedBox(width: 10), // 加个间隙
            RaisedButton(
              onPressed: () {},
              child: Text("按钮阴影"),
              elevation: 10.0,
            ),
            SizedBox(width: 10), // 加个间隙
            RaisedButton(
              onPressed: () {},
              child: Text("水波纹颜色"),
              splashColor: Colors.pinkAccent,
            ),
            SizedBox(width: 10), // 加个间隙
            RaisedButton(
              onPressed: () {},
              child: Container(
                width: 80,
                child: Row(
                  children: [Icon(Icons.search), Text("搜索")],
                ),
              ),
              color: Colors.purpleAccent,
              textColor: Colors.white,
            ),
            SizedBox(width: 10), // 加个间隙
            RaisedButton(
              onPressed: () {},
              child: Container(
                width: 100,
                height: 30,
                child: Row(
                  children: [
                    Image.asset("assets/images/codelieche-logo-blue.png"),
                    Text("编程列车")
                  ],
                ),
              ),
              color: Colors.grey[400],
            ),
            SizedBox(width: 10), // 加个间隙
            Container(
              height: 70,
              child: RaisedButton(
                onPressed: () {},
                child: Text("圆形按钮"),
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),

        // 设置宽度
        SimpleTitleWidget(
          title: "设置宽高",
          description: "外面包裹一层Container设置宽和高",
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Container(
              width: 150,
              height: 50,
              child: RaisedButton(
                onPressed: () {},
                child: Text("设置宽和高"),
              ),
            ),
            SizedBox(width: 10), // 加个间隙
            Container(
              width: 120,
              height: 40,
              child: RaisedButton(
                onPressed: () {},
                child: Text("120 x 40"),
              ),
            ),
            SizedBox(width: 10), // 加个间隙
            Container(
              width: 120,
              height: 40,
              margin: EdgeInsets.all(5.0),
              child: RaisedButton(
                color: Colors.pinkAccent,
                textColor: Colors.white,
                onPressed: () {},
                child: Text("设置圆角"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )
          ],
        ),

        // 自适应按钮
        SimpleTitleWidget(
          title: "自适应按钮",
        ),
        Row(
          children: [
            Expanded(
                child: RaisedButton(
              onPressed: () {},
              child: Text("自适应按钮"),
              color: Colors.lightBlue,
              textColor: Colors.white,
            )),
          ],
        ),
      ],
    );
    return SingleChildScrollView(
      child: body,
    );
  }
}

// InkWell Demo
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class InkWellDemoPage extends StatefulWidget {
  InkWellDemoPage({Key key}) : super(key: key);

  @override
  _InkWellDemoPageState createState() => _InkWellDemoPageState();
}

class _InkWellDemoPageState extends State<InkWellDemoPage> {
  // 点击事件
  onTapFunc() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("InkWeb示例"),
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text("onTap事件"),
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text("点击其它区域关闭"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 给Text添加InkWell
        SimpleTitleWidget(
          title: "给Text添加点击事件",
          description: "InkWell.child: Text()",
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 4 / 1,
          children: [
            Container(
              color: Colors.lightBlue,
              alignment: Alignment.center,
              child: InkWell(
                  onTap: this.onTapFunc,
                  child: Text(
                    "点击我",
                  )),
            ),
            Container(
              color: Colors.pinkAccent,
              alignment: Alignment.center,
              child: InkWell(
                  onTap: this.onTapFunc,
                  child: Text(
                    "需要点文字",
                  )),
            )
          ],
        ),

        // 给Container添加InkWell
        SimpleTitleWidget(
          title: "给Container添加点击事件",
          description: "InkWell.child: Container()",
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 4 / 1,
          children: [
            InkWell(
              onTap: this.onTapFunc,
              child: Container(
                color: Colors.purpleAccent,
                alignment: Alignment.center,
                child: Text(
                  "点击我",
                ),
              ),
            ),
            InkWell(
              onTap: this.onTapFunc,
              child: Container(
                color: Colors.greenAccent,
                alignment: Alignment.center,
                child: Text(
                  "点颜色区域都行",
                ),
              ),
            ),
            InkWell(
              onTap: this.onTapFunc,
              child: Container(
                color: Colors.grey[300],
                alignment: Alignment.center,
                padding: EdgeInsets.all(2.0),
                child: Image.asset("assets/images/codelieche-blue.png"),
              ),
            ),
            InkWell(
              onTap: this.onTapFunc,
              child: Container(
                // color: Colors.white, // 设置了decoration就不可设置color了
                alignment: Alignment.center,
                child: Image.asset("assets/images/codelieche-logo-blue.png"),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
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

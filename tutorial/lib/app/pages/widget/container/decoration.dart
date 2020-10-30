import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ContainerDecorationDemo extends StatelessWidget {
  const ContainerDecorationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: [
        // 基本使用：边框
        SimpleTitleWidget(
          title: "基本使用：border",
        ),

        Wrap(
          children: [
            // 设置4个方向的border
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border(
                left: BorderSide(width: 2.0, color: Colors.lightBlue[400]),
                top: BorderSide(width: 2.0, color: Colors.grey[400]),
                right: BorderSide(width: 2.0, color: Colors.pinkAccent[400]),
                bottom: BorderSide(width: 2.0, color: Colors.purpleAccent),
              )),
            ),

            // 4个方向的border相同
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  // 设置边框的圆角
                  borderRadius: BorderRadius.only(
                    // 设置左上角和右上角的边框圆角
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  border: Border.all(width: 1.0, color: Colors.lightBlue)),
            ),

            // 设置BorderRadius
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  // 设置边框的圆角为20
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(width: 1.0, color: Colors.lightBlue)),
            )
          ],
        ),

        // 基本使用：边框
        SimpleTitleWidget(
          title: "背景：color/image",
        ),

        Wrap(
          children: [
            // 设置背景颜色
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  // 设置边框的圆角为20
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(width: 1.0, color: Colors.lightBlue)),
              alignment: Alignment.topCenter,
              child: Text("背景颜色",
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ),

            // 设置背景图片
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/codelieche-blue.png"),
                      fit: BoxFit.contain),
                  // 设置边框的圆角为20
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(width: 1.0, color: Colors.lightBlue)),
              alignment: Alignment.topCenter,
              child: Text("背景图片",
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ),

            // 设置背景图片和背景色
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  image: DecorationImage(
                      // colorFilter: ColorFilter.mode(
                      //     Colors.lightBlue, BlendMode.colorBurn),
                      image:
                          AssetImage("assets/images/codelieche-logo-blue.png"),
                      fit: BoxFit.contain),
                  // 设置边框的圆角为20
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(width: 1.0, color: Colors.lightBlue)),
              alignment: Alignment.topCenter,
              child: Text(
                "背景图片和颜色",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("decoration"),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
    return scaffold;
  }
}

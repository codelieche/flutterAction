import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';

class ContainerWidthHeightColorDemo extends StatefulWidget {
  ContainerWidthHeightColorDemo({Key key}) : super(key: key);

  @override
  _ContainerWidthHeightColorDemoState createState() =>
      _ContainerWidthHeightColorDemoState();
}

class _ContainerWidthHeightColorDemoState
    extends State<ContainerWidthHeightColorDemo> {
  @override
  Widget build(BuildContext context) {
    Widget body = ListView(
      children: [
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 主轴方向[纵向]居中
          crossAxisAlignment: CrossAxisAlignment.start, // 辅轴方向[横向]start
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 50,
              color: AppPrimaryColor,
              alignment: Alignment.center,
              child: Text("200 x 50", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 50,
              // color: AppPrimaryColor,
              child: Center(
                child:
                    Text("200 x 50", style: TextStyle(color: AppPrimaryColor)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.pinkAccent,
              child: Center(
                child: Text("100 x 100",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 18)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 100,
              color: Color.alphaBlend(Colors.red, Colors.yellow),
              child: Center(
                child: Text("200 x 100", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 40,
              color: Colors.purpleAccent,
              child: Center(
                child: Text("200 x 40", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 10,
              height: 150,
              color: Colors.redAccent,
              child: Center(
                child:
                    Text("10 x 150: ", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 150,
              color: Color.fromRGBO(100, 100, 100, 0.7),
              alignment: Alignment.centerRight,
              child: Text("200 x 150", style: TextStyle(color: Colors.white)),
            ),
          ],
        )),
      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text(
          "设置:width/height/color",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: body,
    );
    return Container(
      child: scaffold,
    );
  }
}

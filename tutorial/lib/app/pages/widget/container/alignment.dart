// Container的属性：aligment示例
import 'package:flutter/material.dart';

class ContainerAlignmentDemo extends StatelessWidget {
  const ContainerAlignmentDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = ListView(
      children: [
        Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.grey[600],
              alignment: Alignment.topLeft,
              child: Text("topLeft[默认]",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.grey[600],
              alignment: Alignment.topCenter,
              child: Text("topCenter",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.grey[600],
              alignment: Alignment.topRight,
              child: Text("topRight",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.purpleAccent,
              alignment: Alignment.centerLeft,
              child: Text("centerLeft",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.purpleAccent,
              alignment: Alignment.center,
              child: Text("center",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.purpleAccent,
              alignment: Alignment.centerRight,
              child: Text("centerRight",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.lightBlue[600],
              alignment: Alignment.bottomLeft,
              child: Text("bottomLeft",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.lightBlue[600],
              alignment: Alignment.bottomCenter,
              child: Text("bottomCenter",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(5),
              color: Colors.lightBlue[600],
              alignment: Alignment.bottomRight,
              child: Text("bottomRight",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ],
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("alignment"),
      ),
      body: body,
    );
  }
}

import 'package:flutter/material.dart';

class ExpandedRowDemo extends StatelessWidget {
  const ExpandedRowDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.layers,
            color: Colors.pinkAccent,
          ),
          title: Text("Row"),
        ),

        // 第1组：Row示例：1：1：1
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.lightBlue,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("1"),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("1"),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.pinkAccent,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("1"),
                ))
          ],
        ),
        Divider(),

        // 第2组Row示例：1：2：2
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.lightBlue,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("1"),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("2"),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.pinkAccent,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("2"),
                ))
          ],
        ),

        Divider(),

        // 第3组Row示例：2：1：1
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.lightBlue,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("2"),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("1"),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.pinkAccent,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("1"),
                ))
          ],
        ),
      ],
    );
    return body;
  }
}

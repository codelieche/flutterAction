// Expanded列的示例
import 'package:flutter/material.dart';

class ExpandedColumnDemo extends StatelessWidget {
  const ExpandedColumnDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // 第一组Column示例
        Container(
          width: 100,
          height: 300,
          color: Colors.grey[400],
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.lightBlue,
                    alignment: Alignment.center,
                    child: Text("1"),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text("1"),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.pinkAccent,
                    alignment: Alignment.center,
                    child: Text("1"),
                  ))
            ],
          ),
        ),

        // 第2组Column示例
        Container(
          width: 100,
          height: 300,
          color: Colors.grey[400],
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.lightBlue,
                    alignment: Alignment.center,
                    child: Text("1"),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text("2"),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.pinkAccent,
                    alignment: Alignment.center,
                    child: Text("2"),
                  ))
            ],
          ),
        ),

        // 第3组Column示例
        Container(
          width: 100,
          height: 300,
          color: Colors.grey[400],
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.lightBlue,
                    alignment: Alignment.center,
                    child: Text("1"),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text("1"),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.pinkAccent,
                    alignment: Alignment.center,
                    child: Text("1"),
                  ))
            ],
          ),
        ),
      ],
    );
    return body;
  }
}

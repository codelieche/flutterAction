import 'package:flutter/material.dart';

class ExpandedFlexDemo extends StatelessWidget {
  const ExpandedFlexDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.topLeft,
          child: Text("示例1：横向，1:1:1分布"),
        ),
        // 第一行：水平示例：1：1：1
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  child: Text("1"),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text("1"),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color: Colors.pinkAccent,
                  alignment: Alignment.center,
                  child: Text("1"),
                ))
          ],
        ),

        // 第2行: 高度100：1：2：2
        Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.topLeft,
          child: Text("示例2：高度100，1:2:2分布"),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
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
        ),

        // 第3行: 高度100：1：2：2
        // 第3行：再1：1：1横向分布
        Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.topLeft,
          child: Text("示例3：高度100，1:2:2分布，第3行：1：1：1"),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
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
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.lightBlue[400],
                                alignment: Alignment.center,
                                child: Text("1"),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.pinkAccent[100],
                                alignment: Alignment.center,
                                child: Text("1"),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.lightBlue[400],
                                alignment: Alignment.center,
                                child: Text("1"),
                              ))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ],
    );

    return body;
  }
}

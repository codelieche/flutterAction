// Loading
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/loading.dart';
import 'package:tutorial/app/components/items/title.dart';

class LoadingBaseDemo extends StatefulWidget {
  LoadingBaseDemo({Key key}) : super(key: key);

  @override
  _LoadingBaseDemoState createState() => _LoadingBaseDemoState();
}

class _LoadingBaseDemoState extends State<LoadingBaseDemo> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        // 加载中
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100.0,
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          // valueColor:
                          //     AlwaysStoppedAnimation(Colors.grey[400]),
                          strokeWidth: 3.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                        ),
                        child: Text(
                          "加载中...",
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        // 图片
        SimpleTitleWidget(
          title: "使用图片",
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100.0,
                child: Container(
                  decoration: ShapeDecoration(
                    // color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        child: Image.asset("assets/images/loading.gif"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                        ),
                        child: Text(
                          "加载中...",
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        // 使用LoadingWidget
        SimpleTitleWidget(
          title: "自定义LoadingWidget",
          description: "LoadingWidget",
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: LoadingWidget(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.lightBlue,
                child: LoadingWidget(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.pinkAccent,
                child: LoadingWidget(),
              ),
            )
          ],
        ),

        // 使用LoadingWidget
        SimpleTitleWidget(
          title: "水平LoadingWidget",
          description: "LoadingWidget(direction: Axis.horizontal)",
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: LoadingWidget(
                  // imageWidth: 20,
                  direction: Axis.horizontal,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.blue[50],
                child: LoadingWidget(
                  // imageWidth: 20,
                  direction: Axis.horizontal,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                child: LoadingWidget(
                  imageWidth: 20,
                  direction: Axis.horizontal,
                ),
              ),
            )
          ],
        )
      ],
    );
    return body;
  }
}

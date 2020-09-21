// Loading
import 'package:flutter/material.dart';

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
                        child: Image.asset("asserts/images/loading.gif"),
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
      ],
    );
    return body;
  }
}

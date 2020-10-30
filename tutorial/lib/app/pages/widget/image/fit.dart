import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

class ImageFitDemoPage extends StatefulWidget {
  ImageFitDemoPage({Key key}) : super(key: key);

  @override
  _ImageFitDemoPageState createState() => _ImageFitDemoPageState();
}

class _ImageFitDemoPageState extends State<ImageFitDemoPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: [
        // 填充的方式
        SimpleTitleWidget(
          title: "默认: contain(尽可能大，充满父容器)",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.grey[400],
              width: 100,
              height: 120,
              child: Image.asset(
                "assets/images/codelieche-logo-blue.png",
              ),
            ),
            Container(
              color: Colors.grey[400],
              width: 100,
              height: 120,
              child: Image.asset(
                "assets/images/codelieche-blue.png",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),

        // Fill Width/Height
        SimpleTitleWidget(
          title: "fitWidth/fitHeight(根据宽/高填充，会截断)",
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[400],
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 120,
                  child: Image.asset("assets/images/codelieche-logo-blue.png",
                      fit: BoxFit.fitWidth),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[400],
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 120,
                  child: Image.asset("assets/images/codelieche-logo-blue.png",
                      fit: BoxFit.fitHeight),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[400],
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 120,
                  child: Image.asset("assets/images/codelieche-blue.png",
                      fit: BoxFit.fitWidth),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[400],
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 120,
                  child: Image.asset("assets/images/codelieche-blue.png",
                      fit: BoxFit.fitHeight),
                )),
          ],
        ),

        // Cover
        SimpleTitleWidget(
          title: "cover: 充满容器(会截断)",
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[400],
                  height: 120,
                  child: Image.asset("assets/images/codelieche-logo-blue.png",
                      fit: BoxFit.cover),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[400],
                  height: 120,
                  child: Image.asset(
                    "assets/images/codelieche-blue.png",
                    fit: BoxFit.cover,
                  ),
                )),
          ],
        ),

        // none
        SimpleTitleWidget(
          title: "none: 图片居中显示(可能会截断)",
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[400],
                  height: 120,
                  child: Image.asset("assets/images/codelieche-logo-blue.png",
                      fit: BoxFit.none),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[400],
                  height: 120,
                  child: Image.asset(
                    "assets/images/codelieche-blue.png",
                    fit: BoxFit.none,
                  ),
                )),
          ],
        ),

        // scaleDown
        SimpleTitleWidget(
          title: "scaleDown: 图片完整显示(可能填充不满)",
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[400],
                  height: 120,
                  child: Image.asset("assets/images/codelieche-logo-blue.png",
                      fit: BoxFit.scaleDown),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[400],
                  height: 120,
                  child: Image.asset(
                    "assets/images/codelieche-blue.png",
                    fit: BoxFit.scaleDown,
                  ),
                )),
          ],
        )
      ],
    );
    return SingleChildScrollView(
      child: body,
    );
  }
}

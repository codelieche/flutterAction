import 'package:flutter/material.dart';
import 'package:tutorial/app/variables.dart';
import 'package:tutorial/app/components/items/title.dart';

class ImageBaseDemoPage extends StatefulWidget {
  ImageBaseDemoPage({Key key}) : super(key: key);

  @override
  _ImageBaseDemoPageState createState() => _ImageBaseDemoPageState();
}

class _ImageBaseDemoPageState extends State<ImageBaseDemoPage> {
  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: [
        // 设置个标题
        SimpleTitleWidget(
          title: "Image.asset",
        ),

        Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            Container(
              color: Colors.grey[300],
              width: 100,
              height: 150,
              margin: EdgeInsets.all(5),
              child: Image.asset(
                "asserts/images/codelieche-blue.png",
              ),
            ),
            Container(
              color: Colors.grey[300],
              width: 100,
              height: 150,
              margin: EdgeInsets.all(5),
              child: Image.asset(
                "asserts/images/codelieche-logo-blue.png",
              ),
            ),
          ],
        ),

        // 使用网络图片
        SimpleTitleWidget(
          title: "NetworkImage",
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                child: Container(
              color: Colors.grey[300],
              margin: EdgeInsets.all(5),
              child: Image(
                  image: NetworkImage(
                      "http://static.codelieche.com/docs/images/2020/07/07160050_86.png")),
            )),
            Expanded(
                child: Container(
              color: Colors.grey[300],
              margin: EdgeInsets.all(5),
              child: Image(
                  image: NetworkImage(
                      "http://static.codelieche.com/docs/images/2020/07/01114209_82.png")),
            )),
          ],
        ),

        // 使用手机图片
        SimpleTitleWidget(
          title: "Image",
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    color: Colors.grey[400],
                    child: Image(
                      image:
                          AssetImage("asserts/images/codelieche-logo-blue.png"),
                      height: 60,
                    ))),
            Expanded(
                flex: 2,
                child: Container(
                    color: Colors.grey[200],
                    child: Image(
                      height: 60,
                      image: AssetImage("asserts/images/codelieche-blue.png"),
                    )))
          ],
        ),

        // 加载图片前先显示个图片
        SimpleTitleWidget(
          title: "FadeInImage",
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                child: FadeInImage.assetNetwork(
                    // 网络图片加载之前先显示本地的一个资源图片
                    placeholder: "asserts/images/codelieche-logo-blue.png",
                    // 网络图片地址
                    image:
                        "http://static.codelieche.com/docs/images/2020/07/07160050_86.png")),
            Expanded(
                child: FadeInImage.assetNetwork(
                    // 网络图片加载之前先显示本地的一个资源图片
                    placeholder: "asserts/images/codelieche-logo-blue.png",
                    // 网络图片地址
                    image:
                        "http://static.codelieche.com/docs/images/2020/07/01114209_82.png"))
          ],
        )
      ],
    );
    return SingleChildScrollView(
      child: body,
    );
  }
}

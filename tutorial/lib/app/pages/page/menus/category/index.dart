// 分类页示例首页
import 'package:flutter/material.dart';
import 'package:tutorial/app/components/items/title.dart';

// 分类的示例页面
import 'leftRight.dart';

class CategoryDemoIndexPage extends StatefulWidget {
  CategoryDemoIndexPage({Key key}) : super(key: key);

  @override
  _CategoryDemoIndexPageState createState() => _CategoryDemoIndexPageState();
}

class _CategoryDemoIndexPageState extends State<CategoryDemoIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 主体内容
    Widget body = Column(
      children: [
        SimpleTitleWidget(title: "基本分类页"),
        Wrap(
          children: [
            RaisedButton(
              color: Colors.pinkAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CategoryLeftRightDemoPage();
                    },
                  ),
                );
              },
              child: Text("左右布局"),
            )
          ],
        )
      ],
    );
    return body;
  }
}

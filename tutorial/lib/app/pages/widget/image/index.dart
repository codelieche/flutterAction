/**
 * 图片相关示例组件的首页
 * 路由：/widget/image/index
 */
import 'package:flutter/material.dart';

class ImageWidgetIndexPage extends StatefulWidget {
  @override
  _ImageWidgetIndexPageState createState() => _ImageWidgetIndexPageState();
}

class _ImageWidgetIndexPageState extends State<ImageWidgetIndexPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
    );
    // 返回
    return scaffold;
  }
}

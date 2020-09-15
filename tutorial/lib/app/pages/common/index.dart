// 常用功能
import 'package:flutter/material.dart';

class CommonIndexPage extends StatefulWidget {
  CommonIndexPage({Key key}) : super(key: key);

  @override
  _CommonIndexPageState createState() => _CommonIndexPageState();
}

class _CommonIndexPageState extends State<CommonIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 页面主体内容
    Widget body = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("拍照/获取照片"),
          subtitle: Text("image_picker"),
          onTap: () {
            Navigator.of(context).pushNamed("/common/imagepicker/index");
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("地图定位"),
          subtitle: Text("amap_location"),
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("WebView"),
          subtitle: Text("webview: flutter_webview"),
          onTap: () {
            Navigator.of(context).pushNamed("/common/webview/index");
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("打开外部应用"),
          subtitle: Text("url_launcher: 网页、电话等"),
          onTap: () {
            Navigator.of(context).pushNamed("/common/urllancher/index");
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text("存储"),
          subtitle: Text("storage: path_provider、shared_preferences"),
          onTap: () {
            Navigator.of(context).pushNamed("/common/storage/index");
          },
        )
      ],
    );

    // 返回
    return SafeArea(
      child: body,
    );
  }
}
